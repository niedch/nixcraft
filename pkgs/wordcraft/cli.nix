{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "wordcraft-cli";
  version = "0.7.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-fchv8wJfGFvjm/GYIq8k8sUE3erT9S7ZnD1pYLzljU0=";
    aarch64-linux = "sha256-hyyPxnHGDF2G61/zbqkc9h7Izg8K3KNEsT0fEMFF/ww=";
  };

  meta.description = "Headless WordCraft: convert, inspect, render, and serve MCP";
}
