{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "gridcraft-cli";
  version = "0.11.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-XrNEOP3fJCcdYwnR9LhtB7uNSSYUM9kLiP0k5CMwxiU=";
    aarch64-linux = "sha256-sDLgPlx5lrAdBF49k+MSF6mRv2sxLTRApU57A/Y1tD0=";
  };

  meta.description = "Headless GridCraft: inspect, convert, evaluate, and serve MCP";
}
