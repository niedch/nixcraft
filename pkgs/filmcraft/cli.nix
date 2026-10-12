{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "filmcraft-cli";
  version = "0.7.0";
  inherit src;
  isGui = false;

  outputHashes = {
    "craft-ui-0.1.0" = "sha256-VhLeT7VLdZAIz6gR9PdFI34IJxHsGF8NE0uzFCN2vIU=";
  };

  meta.description = "Headless FilmCraft: render, export, probe media, and MCP server";
}
