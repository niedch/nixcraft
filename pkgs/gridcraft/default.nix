{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "gridcraft";
  version = "0.16.1";

  hashes = {
    x86_64-linux = "sha256-l7atP75HHS3pTeqqfbMSYko53WPl7h679rOFY9Yqrlc=";
    aarch64-linux = "sha256-OyQci6YIwDVSeAWAIFLtADUDrRFQFmjLfCgkrWGdN6I=";
  };

  meta.description = "GridCraft: Open-source spreadsheet editor (Excel alternative)";
}
