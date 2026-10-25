{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "lightcraft";
  version = "0.13.0";

  hashes = {
    x86_64-linux = "sha256-B+8MY5vSEcHLolLmgDlTwdmUYvVbVh0wv5vXrEpOfXs=";
    aarch64-linux = "sha256-RvEpkzcRGPQVjEsZ/28B4f/cLPgEm+ot2eNvgYUzM4I=";
  };

  meta.description = "LightCraft: Open-source RAW photo processor and non-destructive image editor (Lightroom alternative)";
}
