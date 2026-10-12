{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "wordcraft-cli";
  version = "0.6.0";
  inherit src;
  isGui = false;

  meta.description = "Headless WordCraft: convert, inspect, render, and serve MCP";
}
