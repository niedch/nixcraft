{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "cadcraft";
  version = "0.17.1";

  hashes = {
    x86_64-linux = "sha256-I+XPzjIcitvMVtuB/6LkftnfpESRjbuqo2LWeBAPnlk=";
    aarch64-linux = "sha256-LFiv7b5O4abNKM7DKG2K+0BGW1cH6o8TvIfIZRxvCnk=";
  };

  meta.description = "CADCraft: Open-source 2D CAD drafting and design (AutoCAD alternative)";
}
