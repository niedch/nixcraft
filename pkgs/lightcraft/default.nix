{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "lightcraft";
  version = "0.8.0";

  hashes = {
    x86_64-linux = "sha256-gdVLCeYLRIwFUX8d6jQivqWZhpKooahAYEZjhbnf2cM=";
    aarch64-linux = "sha256-4vmCzXsroYUPdWui7omX9hHwrVGbUeawRDTDxRKhoFo=";
  };

  meta.description = "LightCraft: Open-source RAW photo processor and non-destructive image editor (Lightroom alternative)";
}
