{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "soundcraft-cli";
  version = "0.17.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-hRg4ou2zv3ssoS4cVGDR5rTDa77yBQrwN32W5MJxiJw=";
    aarch64-linux = "sha256-0WOwbPhp+4OUcdhhuWfEZIal8MxYjhK/1WWIH2iAIAM=";
  };

  meta.description = "Headless SoundCraft: bounce, convert, session inspect, and MCP server";
}
