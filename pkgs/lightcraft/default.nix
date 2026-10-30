{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "lightcraft";
  version = "0.15.0";

  hashes = {
    x86_64-linux = "sha256-hR8cFVT9qSj+Qz6cvg4TmjkyMVZVYcLlFStyC7BZgTs=";
    aarch64-linux = "sha256-F7VBOMEbR4FVgOGepRKPQageM9mLfJfCmoEIufyKKRk=";
  };

  meta.description = "LightCraft: Open-source RAW photo processor and non-destructive image editor (Lightroom alternative)";
}
