{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "filmcraft";
  version = "0.8.0";
  withAudio = true;

  hashes = {
    x86_64-linux = "sha256-QZVel8iTJDXytruCRXg8ZoeGsz0rfflivQl2QdpoIR4=";
    aarch64-linux = "sha256-3tlW77tcDLItdJL/gyOMHP9CqIrcTI2L/fo4TcAvF5o=";
  };

  meta.description = "FilmCraft: Open-source non-linear video editor (Premiere / DaVinci Resolve alternative)";
}
