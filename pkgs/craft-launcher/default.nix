{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "craft-launcher";
  version = "0.7.0";

  hashes = {
    x86_64-linux = "sha256-+Aub3P65K8iKVNB+fy4D8YgPP88lwVEYZLPUEY7O4dg=";
    aarch64-linux = "sha256-gvuGpMB4yN7j4WfeLspwTheKi48NgnOqtXz37eD6abQ=";
  };

  appId = "ai.storyteller.artcraft-launcher";

  meta = {
    description = "ArtCraft Launcher: install, update and open the Craft App Suite";
    homepage = "https://github.com/storytold/craft-launcher";
    mainProgram = "artcraft-launcher";
  };
}
