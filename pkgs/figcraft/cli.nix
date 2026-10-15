{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  lib,
  ...
}:

mkCraftApp {
  pname = "figcraft-cli";
  version = "0.6.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-YA8RXdxtnnXwcgwNnFRJwVsz/eJ24IDwE7tEntHaRVM=";
    aarch64-linux = "sha256-jU9sL8yxKM7n2Fw+6FsM+tPWzxLGgeRMvXP/2M1Qvig=";
  };

  meta.description = "Headless FigCraft: Interface design; an open-source, clean-room reimplementation of Figma";
}
