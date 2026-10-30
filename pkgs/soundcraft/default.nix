{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "soundcraft";
  version = "0.14.0";
  withAudio = true;

  hashes = {
    x86_64-linux = "sha256-4fLu4WxtpZ2yPAck6XmSApvcOhmo5kcEdT05jbeDI4c=";
    aarch64-linux = "sha256-SYgmqDFeRsSGLwSdcF7MfISfyxVdtc0NUEjLK73FgEk=";
  };

  meta.description = "SoundCraft: Open-source digital audio workstation (DAW / Pro Tools alternative)";
}
