{
    stdenvNoCC,
    fetchurl,
    autoPatchelfHook,
    libgcc,
    glib,
}:
stdenvNoCC.mkDerivation rec {
    pname = "slang-lsp-tools";
    version = "0.2.0";
    dontBuild = true;
    dontConfigure = true;

    src = fetchurl {
        url = "https://github.com/suzizecat/slang-lsp-tools/releases/download/${version}/slang-lsp.${version}";
        hash = "sha256-K2Upuf5lMvvSBJxmlNFktuZGcUYz0JerCUAIOGXlX0o=";
    };

    nativeBuildInputs = [
        autoPatchelfHook
        libgcc
        glib
    ];
    unpackPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/slang-lsp
    '';
    installPhase = ''
        chmod +x $out/bin/slang-lsp
    '';

    meta = {
        homepage = "https://github.com/suzizecat/slang-lsp-tools";
        description = "Tools based upon slang for language server purpose";
    };
}
