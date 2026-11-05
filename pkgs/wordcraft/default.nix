{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "wordcraft";
  version = "0.15.2";

  hashes = {
    x86_64-linux = "sha256-dJMrxn/l9TVTBah7eertnlq4NvaF4WM69JkhYeR/gKQ=";
    aarch64-linux = "sha256-ddzfA1+PUzxRZdnlLMmaCQmOo6T+XvOPOz5Kdko3rPI=";
  };

  meta.description = "WordCraft: Open-source word processor (Word alternative)";
}
