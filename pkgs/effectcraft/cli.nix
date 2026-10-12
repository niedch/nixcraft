{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "effectcraft-cli";
  version = "0.9.0";
  inherit src;
  isGui = false;

  outputHashes = {
    "craft-ui-0.1.0" = "sha256-VhLeT7VLdZAIz6gR9PdFI34IJxHsGF8NE0uzFCN2vIU=";
    "filmcraft-codecs-0.1.1" = "sha256-WXiX4rF7zSwfu3yu9aNH2/xWYhAYFVX1rdrnccuTD7g=";
  };

  meta.description = "Headless EffectCraft: render, export, composite, and MCP server";
}
