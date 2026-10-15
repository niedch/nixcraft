{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "deckcraft-cli";
  version = "0.7.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-U1r9Hn9tOJ7P549KcCtaNnGSF8TOxVauXX8P13WuVYQ=";
    aarch64-linux = "sha256-bpCGBnwzcvU2HJ6vsnNd0k682uu0FZz91xUf8lCeQ1Q=";
  };

  meta.description = "Headless DeckCraft: render, convert, inspect, and serve MCP";
}
