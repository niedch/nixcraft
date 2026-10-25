{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "effectcraft";
  version = "0.16.0";

  hashes = {
    x86_64-linux = "sha256-k6bJjkp1VSxOXxHgxoNNO2+KZxjBZwqDSfY35u7OoLw=";
    aarch64-linux = "sha256-0QvAYl91b+NbwAUJB59qlqWOL9sY26NEVk+C0+ezpmU=";
  };

  meta.description = "EffectCraft: Open-source visual effects and motion graphics (After Effects alternative)";
}
