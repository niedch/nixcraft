{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "soundcraft";
  version = "0.7.0";
  withAudio = true;

  hashes = {
    x86_64-linux = "sha256-gPL+zRMrmpw6wjkWZLCgIUFpyMwOJ76RejcEVTqRTYE=";
    aarch64-linux = "sha256-Seo4Vy+Cac9VJ9j6e8A8uLoePTbHooK9Ym/EjzcbNkY=";
  };

  meta.description = "SoundCraft: Open-source digital audio workstation (DAW / Pro Tools alternative)";
}
