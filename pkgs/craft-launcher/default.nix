{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "craft-launcher";
  version = "0.4.1";

  hashes = {
    x86_64-linux = "sha256-GO5YT2UcarAPWR+YEY54YxY44Oog+Esjm2w5tCpPVCY=";
    aarch64-linux = "sha256-O2xDIC1ziKdUNcY6OTKoqsbCT1sV+xsYZcgYGIR6/Q8=";
  };

  appId = "ai.storyteller.artcraft-launcher";

  meta = {
    description = "ArtCraft Launcher: install, update and open the Craft App Suite";
    homepage = "https://github.com/storytold/craft-launcher";
    mainProgram = "artcraft-launcher";
  };
}
