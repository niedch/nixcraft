{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "pdfcraft";
  version = "0.7.0";
  inherit src;

  outputHashes = {
    "craft-ui-0.1.0" = "sha256-VhLeT7VLdZAIz6gR9PdFI34IJxHsGF8NE0uzFCN2vIU=";
    "craft-print-0.1.0" = "sha256-J/EJJeDDWXc+QQtpUqnAKKA4piOdPRbH3uG1ms2BRgY=";
  };

  meta.description = "PdfCraft: Open-source PDF editor and reader (Acrobat alternative)";
}
