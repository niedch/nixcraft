{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "craft-launcher";
  version = "0.14.1";

  hashes = {
    x86_64-linux = "sha256-QsHOhWQ5GbyH2qPiRB0DuQ8AShaCo18luVy7mOXwdds=";
    aarch64-linux = "sha256-FdVEtmfjcLsCXMx77SeCDa2G3c+f0jnqQ0/0e+gkPks=";
  };

  appId = "ai.storyteller.artcraft-launcher";

  meta = {
    description = "ArtCraft Launcher: install, update and open the Craft App Suite";
    homepage = "https://github.com/storytold/craft-launcher";
    mainProgram = "artcraft-launcher";
  };
}
