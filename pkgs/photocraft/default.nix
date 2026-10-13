{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "photocraft";
  version = "0.8.0";
  inherit src;

  outputHashes = {
    "craft-print-0.1.0" = "sha256-J/EJJeDDWXc+QQtpUqnAKKA4piOdPRbH3uG1ms2BRgY=";
    "craft-ui-0.1.0" = "sha256-VhLeT7VLdZAIz6gR9PdFI34IJxHsGF8NE0uzFCN2vIU=";
  };

  buildFeatures = [ "heif" ];

  meta.description = "PhotoCraft: Open-source Rust image editor (Photoshop alternative)";
}
