{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "deckcraft";
  version = "0.10.0";

  hashes = {
    x86_64-linux = "sha256-Ds31nBP3ZSDnvH9jgb6lyKytfXWvfzkLh0imb9XObGk=";
    aarch64-linux = "sha256-3xTHQMFAnBy3z19lNAAnZ1fpt+16xif+BQ8YkHUJ3AQ=";
  };

  meta.description = "DeckCraft: Open-source presentation editor (PowerPoint alternative)";
}
