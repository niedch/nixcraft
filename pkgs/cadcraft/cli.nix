{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "cadcraft-cli";
  version = "0.14.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-0FTldp7hgTRpjQdzR2hxyt2JSRqRUjw+slioJia7mec=";
    aarch64-linux = "sha256-HAni+Nt7vmtwnQpeymB+dT/LJmtU6PqDt+fAP5rJS/w=";
  };

  meta.description = "Headless CADCraft: convert, inspect, export, and MCP server";
}
