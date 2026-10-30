{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  lib,
  ...
}:

mkCraftApp {
  pname = "figcraft";
  version = "0.12.1";

  hashes = {
    x86_64-linux = "sha256-xSvgRte+pzeQ81hP/KbseTXfIprc6Pjkg7AyQu4qqx8=";
    aarch64-linux = "sha256-N2v+/m5ZZ3UofKKd8eQ31DiR2VRVmltu03LmDPKP+mA=";
  };

  meta.description = "FigCraft: Interface design; an open-source, clean-room reimplementation of Figma";
}
