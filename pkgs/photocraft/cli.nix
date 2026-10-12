{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "photocraft-cli";
  version = "0.8.0";
  inherit src;
  isGui = false;

  outputHashes = {
    "craft-ui-0.1.0" = "sha256-VhLeT7VLdZAIz6gR9PdFI34IJxHsGF8NE0uzFCN2vIU=";
  };

  buildFeatures = [ "heif" ];

  meta.description = "Headless PhotoCraft: convert, inspect, batch processing, and MCP server";
}
