{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  lib,
  ...
}:

mkCraftApp {
  pname = "figcraft";
  version = "0.10.0";

  hashes = {
    x86_64-linux = "sha256-KPjv4Yd5SY4obOk+lEIFjw2xe0Vw4suSv1JsPnI0hOk=";
    aarch64-linux = "sha256-0rRBc8iJLgCTW/4hVpe9CEa3DM4gHghBj4stuEz8Jns=";
  };

  meta.description = "FigCraft: Interface design; an open-source, clean-room reimplementation of Figma";
}
