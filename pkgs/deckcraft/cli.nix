{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "deckcraft-cli";
  version = "0.15.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-+VV9FTGJWXg5pFYTPc+XJyuqwVIDGHH60K7DttZWB4U=";
    aarch64-linux = "sha256-2OsjEJytTEI/NFuOUDYx5lvo741aju9enruhaX+hOl4=";
  };

  meta.description = "Headless DeckCraft: render, convert, inspect, and serve MCP";
}
