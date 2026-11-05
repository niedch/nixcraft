{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "vectorcraft-cli";
  version = "0.21.1";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-eGVCmEYRl3Lb1d2TlcuojHGQz/W5KxexQRA65yhcmeA=";
    aarch64-linux = "sha256-Qsmq+VeEVKWkLuoah0bDsqFQGTxR3pzxsS58KJ5pO+I=";
  };

  meta.description = "VectorCraft CLI and MCP server";
}
