{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "photocraft";
  version = "0.17.0";

  hashes = {
    x86_64-linux = "sha256-zncpnyQ1NKwdJIqoHJqf0niuQHwCTLkx4Dkx63C+VK8=";
    aarch64-linux = "sha256-j28026GmiAKhVBORctgOajEHWaeKdfAtOdWybM8zhOs=";
  };

  meta.description = "PhotoCraft: Open-source Rust image editor (Photoshop alternative)";
}
