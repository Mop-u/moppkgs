{
  lib,
  stdenv,
  unzip,
  fetchurl,
  requireFile,
  autoPatchelfHook,
  makeDesktopItem,

  bash,
  ffmpeg,
  file,
  freetype,
  harfbuzz,
  icu,
  onnxruntime,
  openssl,
  rnnoise,
  rtmidi,
  sdl3,
  wineWow64Packages,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "veadotube";
  version = "0.6-20260710a";
  src = requireFile {
    name = "veadotube-labs-veadotube-linux-x64.zip";
    url = "https://veado.tube/";
    hash = "sha256-vEYoz7uYDTuDaoHphdpJfAmMCeLMeEnQU4HdraymxRw=";
  };
  sourceRoot = ".";
  system = "x86_64-linux";
  nativeBuildInputs = [
    autoPatchelfHook
    unzip
  ];
  runtimeDependencies = [
    freetype
    harfbuzz
    icu
    onnxruntime
    openssl.out # libssl
    rnnoise
    rtmidi
    sdl3
  ];
  buildInputs = finalAttrs.runtimeDependencies ++ [
    bash
    file
    ffmpeg
    wineWow64Packages.stable
  ];
  installPhase =
    let
      desktopItem = makeDesktopItem {
        name = finalAttrs.pname;
        desktopName = "Veadotube";
        icon = fetchurl {
          url = "https://veado.tube/assets/brand/veadoicon.png";
          hash = "sha256-nyw+vuch9glw7WP5wIKVfU2Koz2DmWZdHSmQvbKqyvM=";
        };
        exec = finalAttrs.meta.mainProgram;
        comment = finalAttrs.meta.description;
      };
      replaceLibFile =
        oldName: new:
        let
          old = "$out/share/${finalAttrs.pname}/lib/${oldName}";
        in
        ''
          rm ${old}
          ln -s ${new} ${old}
        '';
    in
    ''
      mkdir -p $out/share/${finalAttrs.pname}
      cp -r ./* $out/share/${finalAttrs.pname}/
      chmod +x $out/share/${finalAttrs.pname}/veadotube

      rm $out/share/${finalAttrs.pname}/lib/libonnxruntime.so
      rm $out/share/${finalAttrs.pname}/lib/libonnxruntime_providers_shared.so
      ${replaceLibFile "ffmpeg" (lib.getExe ffmpeg)}
      ${replaceLibFile "sdl3.so" "${sdl3}/lib/libSDL3.so"}
      ${replaceLibFile "rnnoise.so" "${rnnoise}/lib/librnnoise.so"}
      ${replaceLibFile "rtmidi.so" "${rtmidi}/lib/librtmidi.so"}

      mkdir -p $out/bin
      cat > $out/bin/veadotube<< EOF
      #! ${lib.getExe bash}
      export WINEPREFIX=\$HOME/.local/share/${finalAttrs.pname}
      export PATH=/run/wrappers/bin:${file}/bin:$PATH
      exec $out/share/${finalAttrs.pname}/veadotube \$@
      EOF
      chmod +x $out/bin/veadotube

      cp -r ${desktopItem}/share/* $out/share/
    '';

  meta = {
    description = "A collection of tools for virtual puppetry made by olmewe and BELLA!.";
    homepage = "https://veado.tube";
    mainProgram = "veadotube";
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    license = [
      {
        # restrictions on corporations apply for both use and redistribution
        shortName = "ISTSL";
        fullName = "\"i'm so tired\" software license 1.0";
        url = "https://olmewe.com/istsl/";
        free = false;
        redistributable = false;
        deprecated = false;
      }
    ];
    platforms = [ "x86_64-linux" ];
  };
})
