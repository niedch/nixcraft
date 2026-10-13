{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "designcraft";
  version = "0.7.0";
  inherit src;

  outputHashes = {
    "craft-ui-0.1.0" = "sha256-VhLeT7VLdZAIz6gR9PdFI34IJxHsGF8NE0uzFCN2vIU=";
    "craft-print-0.1.0" = "sha256-J/EJJeDDWXc+QQtpUqnAKKA4piOdPRbH3uG1ms2BRgY=";
    "winit-0.30.13" = "sha256-q1gDwAj8xU/2OC4CtCG72ZvrkZ436V3zsqh5hovLTcs=";
  };

  meta.description = "DesignCraft: Open-source page layout and desktop publishing (InDesign alternative)";
}
