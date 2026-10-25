{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "wordcraft-cli";
  version = "0.10.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-Lrjqr2vpiaRvWhJShqmfXC9u+lyLsjulCkQju+oQeiA=";
    aarch64-linux = "sha256-L23YeAGbVpQl8ykhpNZCEQFyYQuPBlw0XCvwuBCTvls=";
  };

  meta.description = "Headless WordCraft: convert, inspect, render, and serve MCP";
}
