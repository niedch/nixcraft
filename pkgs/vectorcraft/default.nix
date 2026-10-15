{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "vectorcraft";
  version = "0.11.0";

  hashes = {
    x86_64-linux = "sha256-CrUSb5svlZG8J6EOIOobLyOThLGhb+yIKI7T3m2/gxw=";
    aarch64-linux = "sha256-nUV35h1sxnKMGHT/oPeXtzEalpQTS60jKCzf2d+8iJs=";
  };

  meta.description = "VectorCraft: Open-source Rust vector graphics editor (Illustrator alternative)";
}
