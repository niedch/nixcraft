{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "effectcraft-cli";
  version = "0.18.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-Bx+OtCvmOnhiEX05n5bX7UzFuQrB0Gtrq5k3DQzUraM=";
    aarch64-linux = "sha256-vuOn+Ncghp35+SdrPfL45/VOi56WGrKWZl8kpweLbUg=";
  };

  meta.description = "Headless EffectCraft: render, export, composite, and MCP server";
}
