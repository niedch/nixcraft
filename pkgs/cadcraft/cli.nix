{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "cadcraft-cli";
  version = "0.17.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-I+XPzjIcitvMVtuB/6LkftnfpESRjbuqo2LWeBAPnlk=";
    aarch64-linux = "sha256-LFiv7b5O4abNKM7DKG2K+0BGW1cH6o8TvIfIZRxvCnk=";
  };

  meta.description = "Headless CADCraft: convert, inspect, export, and MCP server";
}
