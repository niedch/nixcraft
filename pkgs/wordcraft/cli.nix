{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "wordcraft-cli";
  version = "0.12.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-0HMAJNtslp5566qcyavN+7GY6pspyb0KKgT5g052Vss=";
    aarch64-linux = "sha256-SwGZP2JO3fyQ+rinXKk7nTwiQnWX8DOARNEbp++2HMU=";
  };

  meta.description = "Headless WordCraft: convert, inspect, render, and serve MCP";
}
