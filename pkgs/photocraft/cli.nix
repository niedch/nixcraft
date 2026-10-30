{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "photocraft-cli";
  version = "0.17.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-zncpnyQ1NKwdJIqoHJqf0niuQHwCTLkx4Dkx63C+VK8=";
    aarch64-linux = "sha256-j28026GmiAKhVBORctgOajEHWaeKdfAtOdWybM8zhOs=";
  };

  meta.description = "Headless PhotoCraft: convert, inspect, batch processing, and MCP server";
}
