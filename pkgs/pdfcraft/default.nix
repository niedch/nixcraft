{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "pdfcraft";
  version = "0.18.2";

  hashes = {
    x86_64-linux = "sha256-vtsfgXPn65+h1YALZbQe07Wletk+VmHGqSGipFAkIpE=";
    aarch64-linux = "sha256-/UhGvpREK4ao5j+5fJmxNrNJKPvyrLbF7PmrMHmCy/I=";
  };

  meta.description = "PdfCraft: Open-source PDF editor and reader (Acrobat alternative)";
}
