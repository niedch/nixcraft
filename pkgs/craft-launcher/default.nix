{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "craft-launcher";
  version = "0.3.2";
  inherit src;

  cargoPackage = "artcraft-launcher";
  appId = "ai.storyteller.artcraft-launcher";

  extraPostInstall = ''
    ln -s artcraft-launcher $out/bin/craft-launcher
  '';

  meta = {
    description = "ArtCraft Launcher: install, update and open the Craft App Suite";
    homepage = "https://github.com/storytold/craft-launcher";
    mainProgram = "artcraft-launcher";
  };
}
