{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "lightcraft-cli";
  version = "0.13.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-B+8MY5vSEcHLolLmgDlTwdmUYvVbVh0wv5vXrEpOfXs=";
    aarch64-linux = "sha256-RvEpkzcRGPQVjEsZ/28B4f/cLPgEm+ot2eNvgYUzM4I=";
  };

  meta.description = "Headless LightCraft: render, catalog, batch processing, and MCP server";
}
