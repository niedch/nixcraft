{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "cadcraft-cli";
  version = "0.12.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-6FFLtojQPPpg32VK3FcGpEJbBGA26HPGheDdL6R+m3M=";
    aarch64-linux = "sha256-hCH6kORgLjR2GwHM6ZOooAnRAu1DKKtzMmhZ//covvc=";
  };

  meta.description = "Headless CADCraft: convert, inspect, export, and MCP server";
}
