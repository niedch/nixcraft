{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "lightcraft-cli";
  version = "0.18.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-NGz4TCYjIpNLSou+6fvX2zjxWRfJPy3QQJeS0Rv6fbA=";
    aarch64-linux = "sha256-UqfG5Dq+9DTs/Zdamjt/gYLMNh2bbqGCYw5Wbcu0qL4=";
  };

  meta.description = "Headless LightCraft: render, catalog, batch processing, and MCP server";
}
