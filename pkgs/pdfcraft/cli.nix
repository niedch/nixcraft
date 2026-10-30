{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "pdfcraft-cli";
  version = "0.15.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-fXdxpiqcgeNbHeKGrTgRDIWlmgQMErlh8CTulyM40v4=";
    aarch64-linux = "sha256-xDAQN4+RgIh2ROqlrYzJ/5FocU4KEI9J5iosG3vgEqA=";
  };

  meta.description = "Headless PdfCraft: inspect, render, split, edit, and MCP server";
}
