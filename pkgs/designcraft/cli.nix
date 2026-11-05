{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "designcraft-cli";
  version = "0.17.2";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-MOnSpasyK+5HmAAQq2ihaBBh2alwDqmJoz2lTwg5cw8=";
    aarch64-linux = "sha256-7deMW+6d7OvcUzi66JY3uVj/XjDbzLg88mkF7J146mY=";
  };

  meta.description = "Headless DesignCraft: convert, render, export PDF/EPUB, and MCP server";
}
