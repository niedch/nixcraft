{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "soundcraft";
  version = "0.6.0";
  inherit src;
  withAudio = true;

  outputHashes = {
    "craft-ui-0.1.0" = "sha256-VhLeT7VLdZAIz6gR9PdFI34IJxHsGF8NE0uzFCN2vIU=";
  };

  meta.description = "SoundCraft: Open-source digital audio workstation (DAW / Pro Tools alternative)";
}
