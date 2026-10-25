#!/usr/bin/env python3
"""
Update Storytold Craft applications in pkgs/ to their latest upstream GitHub releases.
"""

import argparse
import base64
import hashlib
import json
import os
import re
import subprocess
import sys
import urllib.request
from pathlib import Path


def get_repo_root() -> Path:
    for i, arg in enumerate(sys.argv):
        if arg == "--repo-root" and i + 1 < len(sys.argv):
            return Path(sys.argv[i + 1]).resolve()
        if arg.startswith("--repo-root="):
            return Path(arg.split("=", 1)[1]).resolve()

    env = os.environ.get("FLAKE_ROOT") or os.environ.get("REPO_ROOT")
    if env:
        return Path(env).resolve()

    cwd = Path.cwd().resolve()
    for directory in [cwd] + list(cwd.parents):
        if str(directory).startswith("/nix/store"):
            continue
        if (directory / "pkgs").is_dir() and (directory / "flake.nix").is_file():
            return directory

    file_parent = Path(__file__).resolve().parents[2]
    if (file_parent / "pkgs").is_dir() and not str(file_parent).startswith("/nix/store"):
        return file_parent

    return cwd


def get_github_token() -> str | None:
    token = os.environ.get("GITHUB_TOKEN") or os.environ.get("GH_TOKEN")
    if token:
        return token

    gh_hosts = Path.home() / ".config" / "gh" / "hosts.yml"
    if gh_hosts.is_file():
        try:
            for line in gh_hosts.read_text(encoding="utf-8").splitlines():
                if "oauth_token:" in line:
                    return line.split("oauth_token:", 1)[1].strip()
        except Exception:
            pass

    try:
        proc = subprocess.run(["gh", "auth", "token"], capture_output=True, text=True, timeout=5)
        if proc.returncode == 0 and proc.stdout.strip():
            return proc.stdout.strip()
    except Exception:
        pass

    return None


def hex_to_sri(hex_digest: str) -> str:
    raw = bytes.fromhex(hex_digest.strip())
    b64 = base64.b64encode(raw).decode("ascii")
    return f"sha256-{b64}"


def compute_sri_hash(url: str, headers: dict[str, str]) -> str:
    req = urllib.request.Request(url, headers=headers)
    hasher = hashlib.sha256()
    with urllib.request.urlopen(req) as resp:
        while chunk := resp.read(65536):
            hasher.update(chunk)
    b64 = base64.b64encode(hasher.digest()).decode("ascii")
    return f"sha256-{b64}"


def get_release_hashes(
    pkg_name: str,
    version: str,
    assets: list[dict],
    headers: dict[str, str],
) -> dict[str, str]:
    app_image_name = "artcraft-launcher" if pkg_name == "craft-launcher" else pkg_name
    expected_assets = {
        "x86_64-linux": f"{app_image_name}-{version}-linux-x86_64.AppImage",
        "aarch64-linux": f"{app_image_name}-{version}-linux-aarch64.AppImage",
    }

    asset_map = {asset["name"]: asset for asset in assets}

    sums_asset = asset_map.get("SHA256SUMS.txt")
    sums_dict: dict[str, str] = {}
    if sums_asset:
        sums_url = sums_asset.get("browser_download_url") or (
            f"https://github.com/storytold/{pkg_name}/releases/download/v{version}/SHA256SUMS.txt"
        )
        try:
            req = urllib.request.Request(sums_url, headers=headers)
            with urllib.request.urlopen(req) as resp:
                lines = resp.read().decode("utf-8", errors="replace").splitlines()
            for line in lines:
                parts = line.strip().split(None, 1)
                if len(parts) == 2:
                    sha_hex, fn = parts[0], parts[1].lstrip("*")
                    sums_dict[fn] = sha_hex
        except Exception as e:
            print(f"    Warning: Could not fetch SHA256SUMS.txt for {pkg_name} ({e}); falling back to download.")

    hashes: dict[str, str] = {}
    for arch_key, asset_filename in expected_assets.items():
        if asset_filename in sums_dict:
            hashes[arch_key] = hex_to_sri(sums_dict[asset_filename])
        else:
            print(f"    Fallback: downloading {asset_filename} to compute sha256...")
            asset = asset_map.get(asset_filename)
            download_url = (
                asset["browser_download_url"]
                if asset and "browser_download_url" in asset
                else f"https://github.com/storytold/{pkg_name}/releases/download/v{version}/{asset_filename}"
            )
            hashes[arch_key] = compute_sri_hash(download_url, headers)

    return hashes


def update_nix_file(path: Path, new_version: str, hashes: dict[str, str], dry_run: bool = False) -> bool:
    if not path.is_file():
        return False

    content = path.read_text(encoding="utf-8")

    updated, v_count = re.subn(
        r'version\s*=\s*"[^"]+";',
        f'version = "{new_version}";',
        content,
        count=1,
    )
    if v_count == 0:
        raise ValueError(f"Could not locate version field in {path}")

    updated, x_count = re.subn(
        r'x86_64-linux\s*=\s*"[^"]+";',
        f'x86_64-linux = "{hashes["x86_64-linux"]}";',
        updated,
        count=1,
    )
    if x_count == 0:
        raise ValueError(f"Could not locate x86_64-linux hash in {path}")

    updated, a_count = re.subn(
        r'aarch64-linux\s*=\s*"[^"]+";',
        f'aarch64-linux = "{hashes["aarch64-linux"]}";',
        updated,
        count=1,
    )
    if a_count == 0:
        raise ValueError(f"Could not locate aarch64-linux hash in {path}")

    if updated != content:
        if not dry_run:
            path.write_text(updated, encoding="utf-8")
        return True
    return False


def main() -> int:
    parser = argparse.ArgumentParser(description="Update Storytold Craft apps to latest releases")
    parser.add_argument("packages", nargs="*", help="Specific package(s) to update (default: all)")
    parser.add_argument("--repo-root", help="Root directory containing flake.nix and pkgs/")
    parser.add_argument("--dry-run", action="store_true", help="Inspect and display changes without writing files")
    args = parser.parse_args()

    repo_root = Path(args.repo_root).resolve() if args.repo_root else get_repo_root()
    pkgs_dir = repo_root / "pkgs"

    if not pkgs_dir.is_dir():
        print(f"Error: packages directory '{pkgs_dir}' not found.", file=sys.stderr)
        return 1

    headers = {"User-Agent": "nixcraft-update"}
    token = get_github_token()
    if token:
        headers["Authorization"] = f"Bearer {token}"

    all_pkgs = sorted(
        p.name for p in pkgs_dir.iterdir() if p.is_dir() and (p / "default.nix").is_file()
    )

    targets = args.packages if args.packages else all_pkgs
    invalid_targets = [t for t in targets if t not in all_pkgs]
    if invalid_targets:
        print(f"Error: unknown package(s): {', '.join(invalid_targets)}", file=sys.stderr)
        return 1

    print(f"Updating {len(targets)} package(s) in {pkgs_dir}...")
    errors: list[str] = []
    updated_count = 0
    up_to_date_count = 0

    for pkg_name in targets:
        pkg_dir = pkgs_dir / pkg_name
        default_nix = pkg_dir / "default.nix"
        cli_nix = pkg_dir / "cli.nix"

        content = default_nix.read_text(encoding="utf-8")
        match = re.search(r'version\s*=\s*"([^"]+)"', content)
        local_version = match.group(1) if match else "unknown"

        url = f"https://api.github.com/repos/storytold/{pkg_name}/releases/latest"
        try:
            req = urllib.request.Request(url, headers=headers)
            with urllib.request.urlopen(req) as resp:
                data = json.load(resp)
            latest_version = data.get("tag_name", "").lstrip("v")
            if not latest_version:
                raise ValueError("Could not extract latest release tag_name")

            if local_version == latest_version:
                print(f"[{pkg_name}] up to date ({local_version})")
                up_to_date_count += 1
                continue

            print(f"[{pkg_name}] updating {local_version} -> {latest_version}")
            hashes = get_release_hashes(pkg_name, latest_version, data.get("assets", []), headers)
            print(f"  x86_64-linux:  {hashes['x86_64-linux']}")
            print(f"  aarch64-linux: {hashes['aarch64-linux']}")

            update_nix_file(default_nix, latest_version, hashes, dry_run=args.dry_run)
            if cli_nix.is_file():
                update_nix_file(cli_nix, latest_version, hashes, dry_run=args.dry_run)

            updated_count += 1
        except Exception as e:
            print(f"[{pkg_name}] ERROR: {e}", file=sys.stderr)
            errors.append(pkg_name)

    print("-" * 55)
    print(f"Finished: {updated_count} updated, {up_to_date_count} already up to date, {len(errors)} error(s).")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
