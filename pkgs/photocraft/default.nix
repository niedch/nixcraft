{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "photocraft";
  version = "0.9.0";

  hashes = {
    x86_64-linux = "sha256-SDqaeSAODAhku1TPP6pqVeK3nBQz2s/LFT04YuePMrw=";
    aarch64-linux = "sha256-J1K1CX4niMwasMe0EGV7Hqt5C8w7V2+HSd5wcoLbqeM=";
  };

  meta.description = "PhotoCraft: Open-source Rust image editor (Photoshop alternative)";
}
