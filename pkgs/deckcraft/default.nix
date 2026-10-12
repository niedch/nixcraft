{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  src,
  ...
}:

mkCraftApp {
  pname = "deckcraft";
  version = "0.6.0";
  inherit src;

  meta.description = "DeckCraft: Open-source presentation editor (PowerPoint alternative)";
}
