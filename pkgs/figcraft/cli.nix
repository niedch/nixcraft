{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  lib,
  ...
}:

mkCraftApp {
  pname = "figcraft-cli";
  version = "0.15.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-9wvCPup0rNp1kC4VxkJqQ21mRKCDQOU9S2N4dCefW4c=";
    aarch64-linux = "sha256-TQatdbwYUyyi/XFzVhrjEkE4Td6u8RfScptTdOC43g0=";
  };

  meta.description = "Headless FigCraft: Interface design; an open-source, clean-room reimplementation of Figma";
}
