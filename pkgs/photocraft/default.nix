{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "photocraft";
  version = "0.15.1";

  hashes = {
    x86_64-linux = "sha256-fZbz0NoZIdY0YgsNTNo3y/M1OnZ/kguQbOHGZnOA/+0=";
    aarch64-linux = "sha256-GlanyK/nif3n4GKoHqxq2NORrLKX10TTVAG3mibWuTE=";
  };

  meta.description = "PhotoCraft: Open-source Rust image editor (Photoshop alternative)";
}
