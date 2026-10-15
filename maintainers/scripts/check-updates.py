#!/usr/bin/env python3
import json, os, re, sys, urllib.request
from pathlib import Path


def get_repo_root() -> Path:
    if "--repo-root" in sys.argv:
        return Path(sys.argv[sys.argv.index("--repo-root") + 1]).resolve()
    for arg in sys.argv[1:]:
        if arg.startswith("--repo-root="):
            return Path(arg.split("=", 1)[1]).resolve()
        if not arg.startswith("-"):
            return Path(arg).resolve()
    env = os.environ.get("FLAKE_ROOT") or os.environ.get("REPO_ROOT")
    if env:
        return Path(env).resolve()
    cwd = Path.cwd().resolve()
    for directory in [cwd] + list(cwd.parents):
        if (directory / "pkgs").is_dir() and (directory / "flake.nix").is_file():
            return directory
    file_parent = Path(__file__).resolve().parents[2]
    if (file_parent / "pkgs").is_dir():
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
        import subprocess
        proc = subprocess.run(["gh", "auth", "token"], capture_output=True, text=True, timeout=5)
        if proc.returncode == 0 and proc.stdout.strip():
            return proc.stdout.strip()
    except Exception:
        pass
    return None


def main() -> int:
    pkgs_dir = get_repo_root() / "pkgs"
    headers = {"User-Agent": "nixcraft-check"}
    token = get_github_token()
    if token:
        headers["Authorization"] = f"Bearer {token}"

    print(f"{'Application':<19}{'Local':<11}{'Latest':<11}{'Status'}")
    print("-" * 55)

    has_issue = False
    pkg_dirs = sorted(p for p in pkgs_dir.iterdir() if p.is_dir() and (p / "default.nix").is_file())

    for pkg in pkg_dirs:
        content = (pkg / "default.nix").read_text(encoding="utf-8")
        match = re.search(r'version\s*=\s*"([^"]+)"', content)
        local_version = match.group(1) if match else "unknown"

        url = f"https://api.github.com/repos/storytold/{pkg.name}/releases/latest"
        try:
            req = urllib.request.Request(url, headers=headers)
            with urllib.request.urlopen(req) as resp:
                data = json.load(resp)
            latest_version = data.get("tag_name", "").lstrip("v")
            if not match or not latest_version:
                status, has_issue = "ERROR", True
            elif local_version == latest_version:
                status = "UP TO DATE"
            else:
                status, has_issue = "UPDATE AVAILABLE", True
        except Exception:
            latest_version, status, has_issue = "ERROR", "ERROR", True

        print(f"{pkg.name:<19}{local_version:<11}{latest_version:<11}{status}")

    return 1 if has_issue else 0


if __name__ == "__main__":
    sys.exit(main())
