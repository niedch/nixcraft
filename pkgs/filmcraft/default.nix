{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "filmcraft";
  version = "0.14.0";
  withAudio = true;

  hashes = {
    x86_64-linux = "sha256-EzuLiNtt7j+kfdOfwcndkigoOAaje5UVh8xjZa7Jo9M=";
    aarch64-linux = "sha256-tuRH3xfvs63ogNQSoMOFUXcyDcS4zukNOV00PJ+0QsQ=";
  };

  meta.description = "FilmCraft: Open-source non-linear video editor (Premiere / DaVinci Resolve alternative)";
}
