{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "cadcraft";
  version = "0.12.0";

  hashes = {
    x86_64-linux = "sha256-6FFLtojQPPpg32VK3FcGpEJbBGA26HPGheDdL6R+m3M=";
    aarch64-linux = "sha256-hCH6kORgLjR2GwHM6ZOooAnRAu1DKKtzMmhZ//covvc=";
  };

  meta.description = "CADCraft: Open-source 2D CAD drafting and design (AutoCAD alternative)";
}
