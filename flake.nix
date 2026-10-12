{
  description = "Nix packaging and flake for Storytold Craft applications";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    photocraft-src = {
      url = "github:storytold/photocraft";
      flake = false;
    };

    vectorcraft-src = {
      url = "github:storytold/vectorcraft";
      flake = false;
    };

    deckcraft-src = {
      url = "github:storytold/deckcraft";
      flake = false;
    };

    gridcraft-src = {
      url = "github:storytold/gridcraft";
      flake = false;
    };

    wordcraft-src = {
      url = "github:storytold/wordcraft";
      flake = false;
    };

    craft-launcher-src = {
      url = "github:storytold/craft-launcher";
      flake = false;
    };

    cadcraft-src = {
      url = "github:storytold/cadcraft";
      flake = false;
    };

    lightcraft-src = {
      url = "github:storytold/lightcraft";
      flake = false;
    };

    soundcraft-src = {
      url = "github:storytold/soundcraft";
      flake = false;
    };

    designcraft-src = {
      url = "github:storytold/designcraft";
      flake = false;
    };

    filmcraft-src = {
      url = "github:storytold/filmcraft";
      flake = false;
    };

    effectcraft-src = {
      url = "github:storytold/effectcraft";
      flake = false;
    };

    pdfcraft-src = {
      url = "github:storytold/pdfcraft";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    photocraft-src,
    vectorcraft-src,
    deckcraft-src,
    gridcraft-src,
    wordcraft-src,
    craft-launcher-src,
    cadcraft-src,
    lightcraft-src,
    soundcraft-src,
    designcraft-src,
    filmcraft-src,
    effectcraft-src,
    pdfcraft-src,
    ...
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system nixpkgs.legacyPackages.${system});
  in {
    packages = forAllSystems (system: pkgs: let
      mkCraftApp = pkgs.callPackage ./pkgs/common/mk-craft-app.nix { };
    in rec {
      photocraft = pkgs.callPackage ./pkgs/photocraft {
        inherit mkCraftApp;
        src = photocraft-src;
      };
      photocraft-cli = pkgs.callPackage ./pkgs/photocraft/cli.nix {
        inherit mkCraftApp;
        src = photocraft-src;
      };
      vectorcraft = pkgs.callPackage ./pkgs/vectorcraft {
        inherit mkCraftApp;
        src = vectorcraft-src;
      };
      vectorcraft-cli = pkgs.callPackage ./pkgs/vectorcraft/cli.nix {
        inherit mkCraftApp;
        src = vectorcraft-src;
      };
      deckcraft = pkgs.callPackage ./pkgs/deckcraft {
        inherit mkCraftApp;
        src = deckcraft-src;
      };
      deckcraft-cli = pkgs.callPackage ./pkgs/deckcraft/cli.nix {
        inherit mkCraftApp;
        src = deckcraft-src;
      };
      gridcraft = pkgs.callPackage ./pkgs/gridcraft {
        inherit mkCraftApp;
        src = gridcraft-src;
      };
      gridcraft-cli = pkgs.callPackage ./pkgs/gridcraft/cli.nix {
        inherit mkCraftApp;
        src = gridcraft-src;
      };
      wordcraft = pkgs.callPackage ./pkgs/wordcraft {
        inherit mkCraftApp;
        src = wordcraft-src;
      };
      wordcraft-cli = pkgs.callPackage ./pkgs/wordcraft/cli.nix {
        inherit mkCraftApp;
        src = wordcraft-src;
      };
      craft-launcher = pkgs.callPackage ./pkgs/craft-launcher {
        inherit mkCraftApp;
        src = craft-launcher-src;
      };
      cadcraft = pkgs.callPackage ./pkgs/cadcraft {
        inherit mkCraftApp;
        src = cadcraft-src;
      };
      cadcraft-cli = pkgs.callPackage ./pkgs/cadcraft/cli.nix {
        inherit mkCraftApp;
        src = cadcraft-src;
      };
      lightcraft = pkgs.callPackage ./pkgs/lightcraft {
        inherit mkCraftApp;
        src = lightcraft-src;
      };
      lightcraft-cli = pkgs.callPackage ./pkgs/lightcraft/cli.nix {
        inherit mkCraftApp;
        src = lightcraft-src;
      };
      soundcraft = pkgs.callPackage ./pkgs/soundcraft {
        inherit mkCraftApp;
        src = soundcraft-src;
      };
      soundcraft-cli = pkgs.callPackage ./pkgs/soundcraft/cli.nix {
        inherit mkCraftApp;
        src = soundcraft-src;
      };
      designcraft = pkgs.callPackage ./pkgs/designcraft {
        inherit mkCraftApp;
        src = designcraft-src;
      };
      designcraft-cli = pkgs.callPackage ./pkgs/designcraft/cli.nix {
        inherit mkCraftApp;
        src = designcraft-src;
      };
      filmcraft = pkgs.callPackage ./pkgs/filmcraft {
        inherit mkCraftApp;
        src = filmcraft-src;
      };
      filmcraft-cli = pkgs.callPackage ./pkgs/filmcraft/cli.nix {
        inherit mkCraftApp;
        src = filmcraft-src;
      };
      effectcraft = pkgs.callPackage ./pkgs/effectcraft {
        inherit mkCraftApp;
        src = effectcraft-src;
      };
      effectcraft-cli = pkgs.callPackage ./pkgs/effectcraft/cli.nix {
        inherit mkCraftApp;
        src = effectcraft-src;
      };
      pdfcraft = pkgs.callPackage ./pkgs/pdfcraft {
        inherit mkCraftApp;
        src = pdfcraft-src;
      };
      pdfcraft-cli = pkgs.callPackage ./pkgs/pdfcraft/cli.nix {
        inherit mkCraftApp;
        src = pdfcraft-src;
      };
      default = photocraft;
    });

    apps = forAllSystems (system: pkgs: rec {
      photocraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.photocraft;
      };
      photocraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.photocraft-cli;
      };
      vectorcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.vectorcraft;
      };
      vectorcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.vectorcraft-cli;
      };
      deckcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.deckcraft;
      };
      deckcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.deckcraft-cli;
      };
      gridcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.gridcraft;
      };
      gridcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.gridcraft-cli;
      };
      wordcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.wordcraft;
      };
      wordcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.wordcraft-cli;
      };
      craft-launcher = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.craft-launcher;
      };
      cadcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.cadcraft;
      };
      cadcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.cadcraft-cli;
      };
      lightcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.lightcraft;
      };
      lightcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.lightcraft-cli;
      };
      soundcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.soundcraft;
      };
      soundcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.soundcraft-cli;
      };
      designcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.designcraft;
      };
      designcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.designcraft-cli;
      };
      filmcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.filmcraft;
      };
      filmcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.filmcraft-cli;
      };
      effectcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.effectcraft;
      };
      effectcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.effectcraft-cli;
      };
      pdfcraft = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.pdfcraft;
      };
      pdfcraft-cli = {
        type = "app";
        program = nixpkgs.lib.getExe self.packages.${system}.pdfcraft-cli;
      };
      default = photocraft;
    });

    overlays.default = final: prev: let
      mkCraftApp = final.callPackage ./pkgs/common/mk-craft-app.nix { };
    in {
      inherit mkCraftApp;

      photocraft = final.callPackage ./pkgs/photocraft {
        inherit mkCraftApp;
        src = photocraft-src;
      };
      photocraft-cli = final.callPackage ./pkgs/photocraft/cli.nix {
        inherit mkCraftApp;
        src = photocraft-src;
      };
      vectorcraft = final.callPackage ./pkgs/vectorcraft {
        inherit mkCraftApp;
        src = vectorcraft-src;
      };
      vectorcraft-cli = final.callPackage ./pkgs/vectorcraft/cli.nix {
        inherit mkCraftApp;
        src = vectorcraft-src;
      };
      deckcraft = final.callPackage ./pkgs/deckcraft {
        inherit mkCraftApp;
        src = deckcraft-src;
      };
      deckcraft-cli = final.callPackage ./pkgs/deckcraft/cli.nix {
        inherit mkCraftApp;
        src = deckcraft-src;
      };
      gridcraft = final.callPackage ./pkgs/gridcraft {
        inherit mkCraftApp;
        src = gridcraft-src;
      };
      gridcraft-cli = final.callPackage ./pkgs/gridcraft/cli.nix {
        inherit mkCraftApp;
        src = gridcraft-src;
      };
      wordcraft = final.callPackage ./pkgs/wordcraft {
        inherit mkCraftApp;
        src = wordcraft-src;
      };
      wordcraft-cli = final.callPackage ./pkgs/wordcraft/cli.nix {
        inherit mkCraftApp;
        src = wordcraft-src;
      };
      craft-launcher = final.callPackage ./pkgs/craft-launcher {
        inherit mkCraftApp;
        src = craft-launcher-src;
      };
      cadcraft = final.callPackage ./pkgs/cadcraft {
        inherit mkCraftApp;
        src = cadcraft-src;
      };
      cadcraft-cli = final.callPackage ./pkgs/cadcraft/cli.nix {
        inherit mkCraftApp;
        src = cadcraft-src;
      };
      lightcraft = final.callPackage ./pkgs/lightcraft {
        inherit mkCraftApp;
        src = lightcraft-src;
      };
      lightcraft-cli = final.callPackage ./pkgs/lightcraft/cli.nix {
        inherit mkCraftApp;
        src = lightcraft-src;
      };
      soundcraft = final.callPackage ./pkgs/soundcraft {
        inherit mkCraftApp;
        src = soundcraft-src;
      };
      soundcraft-cli = final.callPackage ./pkgs/soundcraft/cli.nix {
        inherit mkCraftApp;
        src = soundcraft-src;
      };
      designcraft = final.callPackage ./pkgs/designcraft {
        inherit mkCraftApp;
        src = designcraft-src;
      };
      designcraft-cli = final.callPackage ./pkgs/designcraft/cli.nix {
        inherit mkCraftApp;
        src = designcraft-src;
      };
      filmcraft = final.callPackage ./pkgs/filmcraft {
        inherit mkCraftApp;
        src = filmcraft-src;
      };
      filmcraft-cli = final.callPackage ./pkgs/filmcraft/cli.nix {
        inherit mkCraftApp;
        src = filmcraft-src;
      };
      effectcraft = final.callPackage ./pkgs/effectcraft {
        inherit mkCraftApp;
        src = effectcraft-src;
      };
      effectcraft-cli = final.callPackage ./pkgs/effectcraft/cli.nix {
        inherit mkCraftApp;
        src = effectcraft-src;
      };
      pdfcraft = final.callPackage ./pkgs/pdfcraft {
        inherit mkCraftApp;
        src = pdfcraft-src;
      };
      pdfcraft-cli = final.callPackage ./pkgs/pdfcraft/cli.nix {
        inherit mkCraftApp;
        src = pdfcraft-src;
      };
    };

    devShells = forAllSystems (system: pkgs: let
      runtimeLibs = with pkgs; [
        wayland
        libxkbcommon
        libGL
        vulkan-loader
        libx11
        libxcursor
        libxi
        libxrandr
        libxcb
        fontconfig
        freetype
        alsa-lib
      ];
    in {
      default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          cargo
          rustc
          rust-analyzer
          clippy
          rustfmt
          pkg-config
        ];

        buildInputs = runtimeLibs;

        RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}/lib/rustlib/src/rust/library";
        RUST_BACKTRACE = 1;

        shellHook = ''
          export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath runtimeLibs}:$LD_LIBRARY_PATH"
        '';
      };
    });
  };
}
