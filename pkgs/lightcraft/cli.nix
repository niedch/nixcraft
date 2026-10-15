{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "lightcraft-cli";
  version = "0.8.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-gdVLCeYLRIwFUX8d6jQivqWZhpKooahAYEZjhbnf2cM=";
    aarch64-linux = "sha256-4vmCzXsroYUPdWui7omX9hHwrVGbUeawRDTDxRKhoFo=";
  };

  meta.description = "Headless LightCraft: render, catalog, batch processing, and MCP server";
}
