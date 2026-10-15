{
  lib,
  stdenv,
  fetchurl,
  appimageTools,
  buildFHSEnv,
  makeWrapper,
  ...
}:

let
  mkCraftApp =
    {
      pname,
      version,
      hash ? null,
      hashes ? { },
      src ? null,
      baseName ? lib.removeSuffix "-cli" pname,
      repo ? baseName,
      appImageName ? (if baseName == "craft-launcher" then "artcraft-launcher" else baseName),
      binaryName ? (
        if isGui then
          (if baseName == "craft-launcher" then "artcraft-launcher" else baseName)
        else
          "${baseName}-cli"
      ),
      appId ? "ai.storyteller.${if baseName == "craft-launcher" then "artcraft-launcher" else baseName}",
      isGui ? (!lib.hasSuffix "-cli" pname),
      withAudio ? isGui,
      installDesktop ? isGui,
      extraPkgs ? pkgs: [ ],
      extraInstallCommands ? "",
      extraPostInstall ? "",
      meta ? { },
      passthru ? { },
      ...
    }@args:
    let
      arch =
        {
          "x86_64-linux" = "x86_64";
          "aarch64-linux" = "aarch64";
        }
        .${stdenv.hostPlatform.system}
          or (throw "Unsupported architecture for Craft apps: ${stdenv.hostPlatform.system}");

      appImageUrl = "https://github.com/storytold/${repo}/releases/download/v${version}/${appImageName}-${version}-linux-${arch}.AppImage";

      resolvedHash =
        if hash != null then
          hash
        else if hashes ? ${stdenv.hostPlatform.system} then
          hashes.${stdenv.hostPlatform.system}
        else
          "";

      resolvedSrc =
        if (hash != null || hashes ? ${stdenv.hostPlatform.system} || src == null) then
          fetchurl {
            url = appImageUrl;
            ${if resolvedHash != "" then "hash" else null} = resolvedHash;
          }
        else if (lib.isDerivation src || !builtins.pathExists "${src}/Cargo.toml") then
          src
        else
          fetchurl {
            url = appImageUrl;
            ${if resolvedHash != "" then "hash" else null} = resolvedHash;
          };

      appimageContents = appimageTools.extract {
        pname = appImageName;
        inherit version;
        src = resolvedSrc;
      };

      resolvedExtraPkgs = if lib.isFunction extraPkgs then extraPkgs else (pkgs: extraPkgs);

      fhsExtraPkgs =
        pkgs:
        [
          pkgs.libxshmfence
          pkgs.vulkan-loader
          pkgs.libGL
          pkgs.libva
        ]
        ++ lib.optionals withAudio [ pkgs.alsa-lib ]
        ++ resolvedExtraPkgs pkgs;

      defaultExtraInstallCommands = ''
        ${lib.optionalString installDesktop ''
          if [ -f "${appimageContents}/${appId}.desktop" ]; then
            install -Dm644 "${appimageContents}/${appId}.desktop" "$out/share/applications/${appId}.desktop"
          elif [ -f "${appimageContents}/usr/share/applications/${appId}.desktop" ]; then
            install -Dm644 "${appimageContents}/usr/share/applications/${appId}.desktop" "$out/share/applications/${appId}.desktop"
          elif [ -f "${appimageContents}/${appImageName}.desktop" ]; then
            install -Dm644 "${appimageContents}/${appImageName}.desktop" "$out/share/applications/${appId}.desktop"
          elif [ -f "${appimageContents}/usr/share/applications/${appImageName}.desktop" ]; then
            install -Dm644 "${appimageContents}/usr/share/applications/${appImageName}.desktop" "$out/share/applications/${appId}.desktop"
          fi

          if [ -f "$out/share/applications/${appId}.desktop" ]; then
            sed -i -e "s|^Exec=AppRun|Exec=${binaryName}|" "$out/share/applications/${appId}.desktop"
          fi

          if [ -d "${appimageContents}/usr/share/icons" ]; then
            install -d "$out/share"
            cp -r "${appimageContents}/usr/share/icons" "$out/share/"
            chmod -R u+w "$out/share"
          fi
          if [ ! -f "$out/share/icons/hicolor/256x256/apps/${appId}.png" ]; then
            if [ -f "${appimageContents}/${appId}.png" ]; then
              install -Dm644 "${appimageContents}/${appId}.png" "$out/share/icons/hicolor/256x256/apps/${appId}.png"
            elif [ -f "${appimageContents}/${appImageName}.png" ]; then
              install -Dm644 "${appimageContents}/${appImageName}.png" "$out/share/icons/hicolor/256x256/apps/${appId}.png"
            elif [ -f "${appimageContents}/.DirIcon" ]; then
              install -Dm644 "${appimageContents}/.DirIcon" "$out/share/icons/hicolor/256x256/apps/${appId}.png"
            fi
          fi

          if [ -f "${appimageContents}/usr/share/mime/packages/${appId}.xml" ]; then
            install -Dm644 "${appimageContents}/usr/share/mime/packages/${appId}.xml" "$out/share/mime/packages/${appId}.xml"
          elif [ -f "${appimageContents}/usr/share/mime/packages/${appImageName}.xml" ]; then
            install -Dm644 "${appimageContents}/usr/share/mime/packages/${appImageName}.xml" "$out/share/mime/packages/${appId}.xml"
          elif [ -f "${appimageContents}/${appId}.mime.xml" ]; then
            install -Dm644 "${appimageContents}/${appId}.mime.xml" "$out/share/mime/packages/${appId}.xml"
          fi

          if [ -f "${appimageContents}/usr/share/metainfo/${appId}.metainfo.xml" ]; then
            install -Dm644 "${appimageContents}/usr/share/metainfo/${appId}.metainfo.xml" "$out/share/metainfo/${appId}.metainfo.xml"
          elif [ -f "${appimageContents}/usr/share/metainfo/${appImageName}.metainfo.xml" ]; then
            install -Dm644 "${appimageContents}/usr/share/metainfo/${appImageName}.metainfo.xml" "$out/share/metainfo/${appId}.metainfo.xml"
          elif [ -f "${appimageContents}/usr/share/appdata/${appId}.appdata.xml" ]; then
            install -Dm644 "${appimageContents}/usr/share/appdata/${appId}.appdata.xml" "$out/share/metainfo/${appId}.appdata.xml"
          fi
        ''}
        ${extraInstallCommands}
        ${extraPostInstall}
        ${lib.optionalString (baseName == "craft-launcher") ''
          if [ -e "$out/bin/craft-launcher" ] && [ ! -e "$out/bin/artcraft-launcher" ]; then
            ln -s craft-launcher "$out/bin/artcraft-launcher"
          elif [ -e "$out/bin/artcraft-launcher" ] && [ ! -e "$out/bin/craft-launcher" ]; then
            ln -s artcraft-launcher "$out/bin/craft-launcher"
          fi
        ''}
      '';

      mainProgram = meta.mainProgram or binaryName;

      defaultMeta = with lib; {
        homepage = "https://github.com/storytold/${repo}";
        license = with licenses; [
          mit
          asl20
        ];
        maintainers = [ ];
        inherit mainProgram;
        platforms = [
          "x86_64-linux"
          "aarch64-linux"
        ];
        sourceProvenance = with sourceTypes; [ binaryNativeCode ];
      };

      defaultPassthru = passthru // {
        inherit appimageContents;
      };
    in
    if isGui then
      appimageTools.wrapType2 {
        inherit pname version;
        executableName = binaryName;
        src = resolvedSrc;
        extraPkgs = fhsExtraPkgs;
        extraInstallCommands = defaultExtraInstallCommands;
        passthru = defaultPassthru;
        meta = defaultMeta // meta;
      }
    else
      buildFHSEnv (
        appimageTools.defaultFhsEnvArgs
        // {
          name = pname;
          pname = pname;
          inherit version;
          executableName = binaryName;
          runScript = "${appimageContents}/usr/bin/${binaryName}";
          targetPkgs = pkgs: (appimageTools.defaultFhsEnvArgs.targetPkgs pkgs) ++ (fhsExtraPkgs pkgs);
          extraInstallCommands = defaultExtraInstallCommands;
          passthru = defaultPassthru;
          meta = defaultMeta // meta;
        }
      );
in
{
  __functor = self: args: mkCraftApp args;
  gui = args: mkCraftApp (args // { isGui = true; });
  cli = args: mkCraftApp (args // { isGui = false; });
}
