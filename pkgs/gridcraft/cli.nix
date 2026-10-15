{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "gridcraft-cli";
  version = "0.7.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-LarOi+Nxmv7nJ9LjU6pL0KwieYwxLJLCxtXkLyf3CBI=";
    aarch64-linux = "sha256-l8aSPhJ8hGxl+ggFDlhAsr1G8kTdo9LsQuwZjBTZQoc=";
  };

  meta.description = "Headless GridCraft: inspect, convert, evaluate, and serve MCP";
}
