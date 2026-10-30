{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "pdfcraft";
  version = "0.15.0";

  hashes = {
    x86_64-linux = "sha256-fXdxpiqcgeNbHeKGrTgRDIWlmgQMErlh8CTulyM40v4=";
    aarch64-linux = "sha256-xDAQN4+RgIh2ROqlrYzJ/5FocU4KEI9J5iosG3vgEqA=";
  };

  meta.description = "PdfCraft: Open-source PDF editor and reader (Acrobat alternative)";
}
