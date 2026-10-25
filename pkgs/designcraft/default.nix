{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "designcraft";
  version = "0.12.0";

  hashes = {
    x86_64-linux = "sha256-fXbEP5ABfh6DmCFVvQV4ZEh/TGisfMZXMTNNkO9R7Zo=";
    aarch64-linux = "sha256-fWOKmPlqKtpifAw+jUdc5Hq91EH0jsj8mDQgL8Nyovs=";
  };

  meta.description = "DesignCraft: Open-source page layout and desktop publishing (InDesign alternative)";
}
