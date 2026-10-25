{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "filmcraft";
  version = "0.12.0";
  withAudio = true;

  hashes = {
    x86_64-linux = "sha256-EJM/kXaDWAVFm7YNy4ECOSsGVGfsoRDbfuFbVaEcnpY=";
    aarch64-linux = "sha256-pewsB7Kkm5YWvr5U5O6RzvN7SiSWOiy3I/kVgqws6rs=";
  };

  meta.description = "FilmCraft: Open-source non-linear video editor (Premiere / DaVinci Resolve alternative)";
}
