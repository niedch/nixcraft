{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "cadcraft";
  version = "0.14.0";

  hashes = {
    x86_64-linux = "sha256-0FTldp7hgTRpjQdzR2hxyt2JSRqRUjw+slioJia7mec=";
    aarch64-linux = "sha256-HAni+Nt7vmtwnQpeymB+dT/LJmtU6PqDt+fAP5rJS/w=";
  };

  meta.description = "CADCraft: Open-source 2D CAD drafting and design (AutoCAD alternative)";
}
