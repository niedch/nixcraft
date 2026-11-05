{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "filmcraft-cli";
  version = "0.17.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-D1JJdbxUyRd6yAbby5y+HZ97+xifpfbLSfVnIkY3fi8=";
    aarch64-linux = "sha256-Lh3j53MgPiDBH6qv1n9ZDARHFUUVREPlwMQXadSmtF8=";
  };

  meta.description = "Headless FilmCraft: render, export, probe media, and MCP server";
}
