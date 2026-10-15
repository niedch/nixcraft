{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "designcraft";
  version = "0.8.0";

  hashes = {
    x86_64-linux = "sha256-iNV3EPVsn7fY4z4EYGHv+DkReXG0AqQQPEszK1yjtd8=";
    aarch64-linux = "sha256-b//15t+tMUWefzyXvhEO0hwGnLYCA4cN56UnRtTnCm0=";
  };

  meta.description = "DesignCraft: Open-source page layout and desktop publishing (InDesign alternative)";
}
