{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "gridcraft-cli";
  version = "0.16.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-l7atP75HHS3pTeqqfbMSYko53WPl7h679rOFY9Yqrlc=";
    aarch64-linux = "sha256-OyQci6YIwDVSeAWAIFLtADUDrRFQFmjLfCgkrWGdN6I=";
  };

  meta.description = "Headless GridCraft: inspect, convert, evaluate, and serve MCP";
}
