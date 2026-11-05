{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "photocraft";
  version = "0.20.2";

  hashes = {
    x86_64-linux = "sha256-vhjRdaCmJ4wwEkJBeTu3ezV++WBG2B8dgYnkksFLwK4=";
    aarch64-linux = "sha256-jymLOaZ9j+UZqZqnUtoBeGLI40bzoTUgVHj9XbW9cDo=";
  };

  meta.description = "PhotoCraft: Open-source Rust image editor (Photoshop alternative)";
}
