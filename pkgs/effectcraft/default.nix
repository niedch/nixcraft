{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "effectcraft";
  version = "0.21.1";

  hashes = {
    x86_64-linux = "sha256-W9VdQHYJugst9IPjqVUFQiOY0rh0MV2lBr6x9NWVjzw=";
    aarch64-linux = "sha256-PX4yarrxpi6iw9XubxHLumWnYbZbxIgO39HOzxCc/1I=";
  };

  meta.description = "EffectCraft: Open-source visual effects and motion graphics (After Effects alternative)";
}
