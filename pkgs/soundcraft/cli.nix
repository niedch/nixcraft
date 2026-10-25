{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "soundcraft-cli";
  version = "0.12.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-phpWaR+tXCKUS0QyKlt9ttcX5b9Hrfjcu8iD9UmFk+s=";
    aarch64-linux = "sha256-H43XCJDajh6nMOgXJBBcGzfPbOwhox1cu17iPddkoJA=";
  };

  meta.description = "Headless SoundCraft: bounce, convert, session inspect, and MCP server";
}
