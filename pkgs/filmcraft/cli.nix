{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "filmcraft-cli";
  version = "0.12.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-EJM/kXaDWAVFm7YNy4ECOSsGVGfsoRDbfuFbVaEcnpY=";
    aarch64-linux = "sha256-pewsB7Kkm5YWvr5U5O6RzvN7SiSWOiy3I/kVgqws6rs=";
  };

  meta.description = "Headless FilmCraft: render, export, probe media, and MCP server";
}
