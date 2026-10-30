{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "deckcraft-cli";
  version = "0.12.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-KW0+avxRZnqGPLGJwsOXL+5rnGQWSEy+CbDefzh26jo=";
    aarch64-linux = "sha256-fSSiJaUV2WmVJQBUP+kTZ6lWD0iPsyfIa0Lz72kMthw=";
  };

  meta.description = "Headless DeckCraft: render, convert, inspect, and serve MCP";
}
