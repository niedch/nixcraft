{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "effectcraft";
  version = "0.18.0";

  hashes = {
    x86_64-linux = "sha256-Bx+OtCvmOnhiEX05n5bX7UzFuQrB0Gtrq5k3DQzUraM=";
    aarch64-linux = "sha256-vuOn+Ncghp35+SdrPfL45/VOi56WGrKWZl8kpweLbUg=";
  };

  meta.description = "EffectCraft: Open-source visual effects and motion graphics (After Effects alternative)";
}
