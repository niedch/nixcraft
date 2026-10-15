{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "effectcraft";
  version = "0.10.0";

  hashes = {
    x86_64-linux = "sha256-0OQBb25ZFb+EdGX8+kBToWB+CvoWs1/tFWp4x16ItlA=";
    aarch64-linux = "sha256-a8LBThWmpLabMuhSt+arc6trjJ9HoDT9apRrI6avcl0=";
  };

  meta.description = "EffectCraft: Open-source visual effects and motion graphics (After Effects alternative)";
}
