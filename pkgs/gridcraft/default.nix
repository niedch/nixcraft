{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "gridcraft";
  version = "0.6.0";
  inherit src;

  meta.description = "GridCraft: Open-source spreadsheet editor (Excel alternative)";
}
