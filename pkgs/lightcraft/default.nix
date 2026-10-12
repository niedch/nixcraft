{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "lightcraft";
  version = "0.7.0";
  inherit src;

  outputHashes = {
    "craft-ui-0.1.0" = "sha256-VhLeT7VLdZAIz6gR9PdFI34IJxHsGF8NE0uzFCN2vIU=";
  };

  buildFeatures = [ "heif" ];

  meta.description = "LightCraft: Open-source RAW photo processor and non-destructive image editor (Lightroom alternative)";
}
