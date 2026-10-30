{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "deckcraft";
  version = "0.12.0";

  hashes = {
    x86_64-linux = "sha256-KW0+avxRZnqGPLGJwsOXL+5rnGQWSEy+CbDefzh26jo=";
    aarch64-linux = "sha256-fSSiJaUV2WmVJQBUP+kTZ6lWD0iPsyfIa0Lz72kMthw=";
  };

  meta.description = "DeckCraft: Open-source presentation editor (PowerPoint alternative)";
}
