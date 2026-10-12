{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "gridcraft-cli";
  version = "0.6.0";
  inherit src;
  isGui = false;

  meta.description = "Headless GridCraft: inspect, convert, evaluate, and serve MCP";
}
