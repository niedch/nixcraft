{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "gridcraft";
  version = "0.13.0";

  hashes = {
    x86_64-linux = "sha256-KofDeUyyp9AkKlHHaViDuL6uUafF+sWJp9WN3hlYs4U=";
    aarch64-linux = "sha256-M/PSiiN76iBCA+8Fdvg1+s+n4QkQzlAohr+PW0NMu3s=";
  };

  meta.description = "GridCraft: Open-source spreadsheet editor (Excel alternative)";
}
