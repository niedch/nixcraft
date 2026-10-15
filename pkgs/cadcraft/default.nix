{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "cadcraft";
  version = "0.7.0";

  hashes = {
    x86_64-linux = "sha256-sqooB8iG4brnsAZPR2iKYu1v4foF8Fs1LjYs3GmPC3c=";
    aarch64-linux = "sha256-jHRb/0KslPeE0ijwOo8dcz8Cmwnydx1pBzaQUy0ISF4=";
  };

  meta.description = "CADCraft: Open-source 2D CAD drafting and design (AutoCAD alternative)";
}
