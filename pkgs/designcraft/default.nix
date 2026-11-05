{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "designcraft";
  version = "0.17.2";

  hashes = {
    x86_64-linux = "sha256-MOnSpasyK+5HmAAQq2ihaBBh2alwDqmJoz2lTwg5cw8=";
    aarch64-linux = "sha256-7deMW+6d7OvcUzi66JY3uVj/XjDbzLg88mkF7J146mY=";
  };

  meta.description = "DesignCraft: Open-source page layout and desktop publishing (InDesign alternative)";
}
