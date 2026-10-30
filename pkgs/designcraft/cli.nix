{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "designcraft-cli";
  version = "0.14.0";
  isGui = false;

  hashes = {
    x86_64-linux = "sha256-x7mkt2DkyUsF/eTNHCZoI6c2vD+lBxUM/w3Bkg7fwo4=";
    aarch64-linux = "sha256-qjQu22VDSHKQ6Bpj1h/Twx/AOIdfd+LHhthEGctF0EU=";
  };

  meta.description = "Headless DesignCraft: convert, render, export PDF/EPUB, and MCP server";
}
