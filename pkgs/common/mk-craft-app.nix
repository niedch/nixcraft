{
  lib,
  rustPlatform,
  makeWrapper,
  pkg-config,
  wayland,
  libxkbcommon,
  libGL,
  vulkan-loader,
  libx11,
  libxcursor,
  libxi,
  libxrandr,
  libxcb,
  fontconfig,
  freetype,
  alsa-lib,
}:

let
  graphicsLibs = [
    wayland
    libxkbcommon
    libGL
    vulkan-loader
    libx11
    libxcursor
    libxi
    libxrandr
    libxcb
  ];

  fontLibs = [
    fontconfig
    freetype
  ];

  audioLibs = [
    alsa-lib
  ];

  mkCraftApp =
    {
      pname,
      version,
      src,
      isGui ? true,
      withAudio ? isGui,
      cargoPackage ? pname,
      cargoBuildFlags ? [ "--package=${cargoPackage}" ],
      cargoTestFlags ? [ "--package=${cargoPackage}" ],
      buildFeatures ? [ ],
      cargoLock ? null,
      lockFile ? "${src}/Cargo.lock",
      outputHashes ? { },
      nativeBuildInputs ? [ ],
      buildInputs ? [ ],
      extraRuntimeLibs ? [ ],
      appId ? "ai.storyteller.${pname}",
      releaseDate ? "2026-01-01",
      installDesktop ? isGui,
      wrapBinary ? isGui,
      extraPostInstall ? "",
      meta ? { },
      ...
    }@args:
    let
      # Libraries dynamically loaded via dlopen at runtime (LD_LIBRARY_PATH)
      defaultRuntimeLibs =
        lib.optionals isGui (graphicsLibs ++ lib.optionals withAudio audioLibs)
        ++ extraRuntimeLibs;

      # Libraries linked or resolved via pkg-config at build time
      defaultBuildInputs =
        lib.optionals isGui (defaultRuntimeLibs ++ fontLibs)
        ++ buildInputs;

      # Host build tooling
      defaultNativeBuildInputs =
        [ pkg-config ]
        ++ lib.optionals (isGui || wrapBinary) [ makeWrapper ]
        ++ nativeBuildInputs;

      resolvedCargoLock =
        if cargoLock != null then
          cargoLock
        else
          {
            inherit lockFile;
          }
          // lib.optionalAttrs (outputHashes != null && outputHashes != { }) {
            inherit outputHashes;
          };

      mainProgram = meta.mainProgram or pname;

      defaultPostInstall = ''
        ${lib.optionalString installDesktop ''
          if [ -f "packaging/linux/${appId}.desktop" ]; then
            install -Dm644 "packaging/linux/${appId}.desktop" "$out/share/applications/${appId}.desktop"
          fi

          if [ -f "packaging/linux/${appId}.mime.xml" ]; then
            install -Dm644 "packaging/linux/${appId}.mime.xml" "$out/share/mime/packages/${appId}.xml"
          fi

          if [ -d "assets/app-icon/hicolor" ]; then
            install -d "$out/share/icons"
            cp -r assets/app-icon/hicolor "$out/share/icons/"
          fi

          if [ -f "packaging/linux/${appId}.metainfo.xml.in" ]; then
            install -d "$out/share/metainfo"
            sed -e "s/@VERSION@/${version}/g" -e "s/@DATE@/${releaseDate}/g" \
              "packaging/linux/${appId}.metainfo.xml.in" > "$out/share/metainfo/${appId}.metainfo.xml"
          fi
        ''}
        ${lib.optionalString wrapBinary ''
          wrapProgram "$out/bin/${mainProgram}" \
            --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath defaultRuntimeLibs}" \
            --prefix PATH : "${lib.makeBinPath [ fontconfig ]}"
        ''}
        ${extraPostInstall}
      '';

      defaultMeta = with lib; {
        homepage = "https://github.com/storytold/${lib.removeSuffix "-cli" pname}";
        license = with licenses; [ mit asl20 ];
        maintainers = [ ];
        inherit mainProgram;
        platforms = platforms.linux;
      };

      # Strip helper-specific arguments before passing to buildRustPackage
      rustPackageArgs = removeAttrs args [
        "isGui"
        "withAudio"
        "cargoPackage"
        "lockFile"
        "outputHashes"
        "extraRuntimeLibs"
        "appId"
        "releaseDate"
        "installDesktop"
        "wrapBinary"
        "extraPostInstall"
      ];
    in
    rustPlatform.buildRustPackage (
      rustPackageArgs
      // {
        inherit pname version src;
        cargoLock = resolvedCargoLock;
        inherit cargoBuildFlags cargoTestFlags;
        nativeBuildInputs = defaultNativeBuildInputs;
        buildInputs = defaultBuildInputs;
        postInstall = defaultPostInstall;

        meta = defaultMeta // meta;

        passthru = (args.passthru or { }) // {
          runtimeLibs = defaultRuntimeLibs;
        };
      }
      // lib.optionalAttrs (buildFeatures != [ ]) {
        inherit buildFeatures;
      }
    );
in
{
  __functor = self: args: mkCraftApp args;
  inherit graphicsLibs fontLibs audioLibs;
  guiRuntimeLibs = graphicsLibs ++ audioLibs;
  guiBuildInputs = graphicsLibs ++ fontLibs ++ audioLibs;
  gui = args: mkCraftApp (args // { isGui = true; });
  cli = args: mkCraftApp (args // { isGui = false; });
}
