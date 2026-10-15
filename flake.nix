{
  description = "Nix packaging and flake for Storytold Craft applications";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system nixpkgs.legacyPackages.${system});

    craftPackages = pkgs: let
      mkCraftApp = pkgs.callPackage ./pkgs/common/mk-craft-app.nix { };
    in {
      photocraft = pkgs.callPackage ./pkgs/photocraft { inherit mkCraftApp; };
      photocraft-cli = pkgs.callPackage ./pkgs/photocraft/cli.nix { inherit mkCraftApp; };
      vectorcraft = pkgs.callPackage ./pkgs/vectorcraft { inherit mkCraftApp; };
      vectorcraft-cli = pkgs.callPackage ./pkgs/vectorcraft/cli.nix { inherit mkCraftApp; };
      deckcraft = pkgs.callPackage ./pkgs/deckcraft { inherit mkCraftApp; };
      deckcraft-cli = pkgs.callPackage ./pkgs/deckcraft/cli.nix { inherit mkCraftApp; };
      gridcraft = pkgs.callPackage ./pkgs/gridcraft { inherit mkCraftApp; };
      gridcraft-cli = pkgs.callPackage ./pkgs/gridcraft/cli.nix { inherit mkCraftApp; };
      wordcraft = pkgs.callPackage ./pkgs/wordcraft { inherit mkCraftApp; };
      wordcraft-cli = pkgs.callPackage ./pkgs/wordcraft/cli.nix { inherit mkCraftApp; };
      craft-launcher = pkgs.callPackage ./pkgs/craft-launcher { inherit mkCraftApp; };
      cadcraft = pkgs.callPackage ./pkgs/cadcraft { inherit mkCraftApp; };
      cadcraft-cli = pkgs.callPackage ./pkgs/cadcraft/cli.nix { inherit mkCraftApp; };
      lightcraft = pkgs.callPackage ./pkgs/lightcraft { inherit mkCraftApp; };
      lightcraft-cli = pkgs.callPackage ./pkgs/lightcraft/cli.nix { inherit mkCraftApp; };
      soundcraft = pkgs.callPackage ./pkgs/soundcraft { inherit mkCraftApp; };
      soundcraft-cli = pkgs.callPackage ./pkgs/soundcraft/cli.nix { inherit mkCraftApp; };
      designcraft = pkgs.callPackage ./pkgs/designcraft { inherit mkCraftApp; };
      designcraft-cli = pkgs.callPackage ./pkgs/designcraft/cli.nix { inherit mkCraftApp; };
      filmcraft = pkgs.callPackage ./pkgs/filmcraft { inherit mkCraftApp; };
      filmcraft-cli = pkgs.callPackage ./pkgs/filmcraft/cli.nix { inherit mkCraftApp; };
      effectcraft = pkgs.callPackage ./pkgs/effectcraft { inherit mkCraftApp; };
      effectcraft-cli = pkgs.callPackage ./pkgs/effectcraft/cli.nix { inherit mkCraftApp; };
      pdfcraft = pkgs.callPackage ./pkgs/pdfcraft { inherit mkCraftApp; };
      pdfcraft-cli = pkgs.callPackage ./pkgs/pdfcraft/cli.nix { inherit mkCraftApp; };
    };
  in {
    packages = forAllSystems (system: pkgs: let
      pkgs' = craftPackages pkgs;
      allCraftApps = pkgs.linkFarm "all-craft-apps" (pkgs.lib.mapAttrsToList (name: pkg: { inherit name; path = pkg; }) pkgs');
      checkUpdatesScript = pkgs.writeShellApplication {
        name = "check-updates";
        runtimeInputs = [ pkgs.python3 ];
        meta.description = "Check upstream GitHub releases for Storytold Craft applications";
        text = ''
          exec python3 "${./maintainers/scripts/check-updates.py}" "$@"
        '';
      };
    in pkgs' // {
      default = pkgs'.photocraft;
      all = allCraftApps;
      check-updates = checkUpdatesScript;
      update = checkUpdatesScript;
    });

    apps = forAllSystems (system: _pkgs:
      builtins.mapAttrs (_: pkg: {
        type = "app";
        program = nixpkgs.lib.getExe pkg;
        meta = pkg.meta or { };
      }) (builtins.removeAttrs self.packages.${system} [ "all" ])
    );

    overlays.default = final: prev: {
      mkCraftApp = final.callPackage ./pkgs/common/mk-craft-app.nix { };
    } // (craftPackages final);

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
