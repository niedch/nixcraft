{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "soundcraft";
  version = "0.17.1";
  withAudio = true;

  hashes = {
    x86_64-linux = "sha256-hRg4ou2zv3ssoS4cVGDR5rTDa77yBQrwN32W5MJxiJw=";
    aarch64-linux = "sha256-0WOwbPhp+4OUcdhhuWfEZIal8MxYjhK/1WWIH2iAIAM=";
  };

  meta.description = "SoundCraft: Open-source digital audio workstation (DAW / Pro Tools alternative)";
}
