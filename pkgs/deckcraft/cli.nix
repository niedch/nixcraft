{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "deckcraft-cli";
  version = "0.6.0";
  inherit src;
  isGui = false;

  meta.description = "Headless DeckCraft: render, convert, inspect, and serve MCP";
}
