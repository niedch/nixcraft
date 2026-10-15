{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "pdfcraft-cli";
  version = "0.8.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-a4k5fsEK1QXnMvGJgratFxqrCF2TjKDDA0oA1BmeOPc=";
    aarch64-linux = "sha256-l9+yYmXBDQ3S3WaCf3eo681CHa8REGstZysW77husMg=";
  };

  meta.description = "Headless PdfCraft: inspect, render, split, edit, and MCP server";
}
