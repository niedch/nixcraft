{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "craft-launcher";
  version = "0.10.0";

  hashes = {
    x86_64-linux = "sha256-LH8/nHPdlEUx3wc+pugAz/W6nVM9AP8fABVHDvF0Eq0=";
    aarch64-linux = "sha256-A/QSZbaPIs76f7t94uPGNf0qFVkshGxGavmazONmbLE=";
  };

  appId = "ai.storyteller.artcraft-launcher";

  meta = {
    description = "ArtCraft Launcher: install, update and open the Craft App Suite";
    homepage = "https://github.com/storytold/craft-launcher";
    mainProgram = "artcraft-launcher";
  };
}
