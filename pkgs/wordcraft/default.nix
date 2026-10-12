{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "wordcraft";
  version = "0.6.0";
  inherit src;

  meta.description = "WordCraft: Open-source word processor (Word alternative)";
}
