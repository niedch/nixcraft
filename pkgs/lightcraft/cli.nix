{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "lightcraft-cli";
  version = "0.15.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-hR8cFVT9qSj+Qz6cvg4TmjkyMVZVYcLlFStyC7BZgTs=";
    aarch64-linux = "sha256-F7VBOMEbR4FVgOGepRKPQageM9mLfJfCmoEIufyKKRk=";
  };

  meta.description = "Headless LightCraft: render, catalog, batch processing, and MCP server";
}
