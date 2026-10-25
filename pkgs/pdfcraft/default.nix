{
  callPackage,
  mkCraftApp ? callPackage ../common/mk-craft-app.nix { },
  ...
}:

mkCraftApp {
  pname = "pdfcraft";
  version = "0.13.0";

  hashes = {
    x86_64-linux = "sha256-P8ZO1lHbJiuZT82cw9XXuy5NR5mktKGzh5Ldtf4QbGA=";
    aarch64-linux = "sha256-1g4Q8bnVPs+8enzcXFjKvAaMtcba2KjomcOjHBPwkw4=";
  };

  meta.description = "PdfCraft: Open-source PDF editor and reader (Acrobat alternative)";
}
