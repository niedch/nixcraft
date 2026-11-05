{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "wordcraft-cli";
  version = "0.15.2";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-dJMrxn/l9TVTBah7eertnlq4NvaF4WM69JkhYeR/gKQ=";
    aarch64-linux = "sha256-ddzfA1+PUzxRZdnlLMmaCQmOo6T+XvOPOz5Kdko3rPI=";
  };

  meta.description = "Headless WordCraft: convert, inspect, render, and serve MCP";
}
