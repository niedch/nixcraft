{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "soundcraft-cli";
  version = "0.14.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-4fLu4WxtpZ2yPAck6XmSApvcOhmo5kcEdT05jbeDI4c=";
    aarch64-linux = "sha256-SYgmqDFeRsSGLwSdcF7MfISfyxVdtc0NUEjLK73FgEk=";
  };

  meta.description = "Headless SoundCraft: bounce, convert, session inspect, and MCP server";
}
