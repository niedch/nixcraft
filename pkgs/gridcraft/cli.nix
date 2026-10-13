{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "gridcraft-cli";
  version = "0.6.0";
  inherit src;
  isGui = false;

  outputHashes = {
    "craft-ui-0.1.0" = "sha256-u2AR5YZZSRzhWaevgR2S/jofD99J3YWKJA+CktUJbRY=";
    "craft-print-0.1.0" = "sha256-u2AR5YZZSRzhWaevgR2S/jofD99J3YWKJA+CktUJbRY=";
  };

  meta.description = "Headless GridCraft: inspect, convert, evaluate, and serve MCP";
}
