{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "designcraft-cli";
  version = "0.12.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-fXbEP5ABfh6DmCFVvQV4ZEh/TGisfMZXMTNNkO9R7Zo=";
    aarch64-linux = "sha256-fWOKmPlqKtpifAw+jUdc5Hq91EH0jsj8mDQgL8Nyovs=";
  };

  meta.description = "Headless DesignCraft: convert, render, export PDF/EPUB, and MCP server";
}
