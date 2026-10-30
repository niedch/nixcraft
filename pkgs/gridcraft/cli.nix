{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "gridcraft-cli";
  version = "0.13.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-KofDeUyyp9AkKlHHaViDuL6uUafF+sWJp9WN3hlYs4U=";
    aarch64-linux = "sha256-M/PSiiN76iBCA+8Fdvg1+s+n4QkQzlAohr+PW0NMu3s=";
  };

  meta.description = "Headless GridCraft: inspect, convert, evaluate, and serve MCP";
}
