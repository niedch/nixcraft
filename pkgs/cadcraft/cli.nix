{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "cadcraft-cli";
  version = "0.6.1";
  inherit src;
  isGui = false;

  outputHashes = {
    "craft-ui-0.1.0" = "sha256-VhLeT7VLdZAIz6gR9PdFI34IJxHsGF8NE0uzFCN2vIU=";
  };

  meta.description = "Headless CADCraft: convert, inspect, export, and MCP server";
}
