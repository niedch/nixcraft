{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "vectorcraft-cli";
  version = "0.18.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-ng1If8cbEi6W8ZsTbTrNs4XqpAn21KgDRVfyNWLyEIo=";
    aarch64-linux = "sha256-QxKRfcBwTYln0cPTf8OFTVrhNWMcF7tMy4EawTc6st8=";
  };

  meta.description = "VectorCraft CLI and MCP server";
}
