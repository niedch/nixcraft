{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "gridcraft";
  version = "0.11.1";

  hashes = {
    x86_64-linux = "sha256-XrNEOP3fJCcdYwnR9LhtB7uNSSYUM9kLiP0k5CMwxiU=";
    aarch64-linux = "sha256-sDLgPlx5lrAdBF49k+MSF6mRv2sxLTRApU57A/Y1tD0=";
  };

  meta.description = "GridCraft: Open-source spreadsheet editor (Excel alternative)";
}
