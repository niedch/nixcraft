{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "designcraft-cli";
  version = "0.8.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-iNV3EPVsn7fY4z4EYGHv+DkReXG0AqQQPEszK1yjtd8=";
    aarch64-linux = "sha256-b//15t+tMUWefzyXvhEO0hwGnLYCA4cN56UnRtTnCm0=";
  };

  meta.description = "Headless DesignCraft: convert, render, export PDF/EPUB, and MCP server";
}
