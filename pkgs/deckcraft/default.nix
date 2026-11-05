{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "deckcraft";
  version = "0.15.1";

  hashes = {
    x86_64-linux = "sha256-+VV9FTGJWXg5pFYTPc+XJyuqwVIDGHH60K7DttZWB4U=";
    aarch64-linux = "sha256-2OsjEJytTEI/NFuOUDYx5lvo741aju9enruhaX+hOl4=";
  };

  meta.description = "DeckCraft: Open-source presentation editor (PowerPoint alternative)";
}
