{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "effectcraft-cli";
  version = "0.21.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-W9VdQHYJugst9IPjqVUFQiOY0rh0MV2lBr6x9NWVjzw=";
    aarch64-linux = "sha256-PX4yarrxpi6iw9XubxHLumWnYbZbxIgO39HOzxCc/1I=";
  };

  meta.description = "Headless EffectCraft: render, export, composite, and MCP server";
}
