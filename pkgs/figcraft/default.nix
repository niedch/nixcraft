{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  lib,
  ...
}:

mkCraftApp {
  pname = "figcraft";
  version = "0.6.0";

  hashes = {
    x86_64-linux = "sha256-YA8RXdxtnnXwcgwNnFRJwVsz/eJ24IDwE7tEntHaRVM=";
    aarch64-linux = lib.fakeHash;
  };

  meta.description = "FigCraft: Interface design; an open-source, clean-room reimplementation of Figma";
}
