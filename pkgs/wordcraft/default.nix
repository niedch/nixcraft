{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "wordcraft";
  version = "0.10.0";

  hashes = {
    x86_64-linux = "sha256-Lrjqr2vpiaRvWhJShqmfXC9u+lyLsjulCkQju+oQeiA=";
    aarch64-linux = "sha256-L23YeAGbVpQl8ykhpNZCEQFyYQuPBlw0XCvwuBCTvls=";
  };

  meta.description = "WordCraft: Open-source word processor (Word alternative)";
}
