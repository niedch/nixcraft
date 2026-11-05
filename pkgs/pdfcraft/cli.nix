{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "pdfcraft-cli";
  version = "0.18.2";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-vtsfgXPn65+h1YALZbQe07Wletk+VmHGqSGipFAkIpE=";
    aarch64-linux = "sha256-/UhGvpREK4ao5j+5fJmxNrNJKPvyrLbF7PmrMHmCy/I=";
  };

  meta.description = "Headless PdfCraft: inspect, render, split, edit, and MCP server";
}
