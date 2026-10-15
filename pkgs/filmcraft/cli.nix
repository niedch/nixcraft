{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "filmcraft-cli";
  version = "0.8.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-QZVel8iTJDXytruCRXg8ZoeGsz0rfflivQl2QdpoIR4=";
    aarch64-linux = "sha256-3tlW77tcDLItdJL/gyOMHP9CqIrcTI2L/fo4TcAvF5o=";
  };

  meta.description = "Headless FilmCraft: render, export, probe media, and MCP server";
}
