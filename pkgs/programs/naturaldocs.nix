{
    lib,
    stdenv,
    fetchurl,
    bash,
    mono,
    unzip,
}:

stdenv.mkDerivation rec {
    pname = "naturaldocs";
    version = "2.3.1";
    dontConfigure = true;

    src = fetchurl {
        url = "https://naturaldocs.org/download/natural_docs/${version}/Natural_Docs_${version}.zip";
        hash = "sha256-khROLesf8mBtKTQ8/qID6okFSa0vd8A98c6i2AFJcss=";
    };

    nativeBuildInputs = [ unzip ];

    buildInputs = [
        mono
        bash
    ];

    installPhase = ''
        mkdir -p $out/NaturalDocs
        cp -r ./* $out/NaturalDocs/
        mkdir -p $out/bin
        cat > $out/bin/NaturalDocs<< EOF
        #! ${lib.getExe bash}
        exec ${mono}/bin/mono $out/NaturalDocs/NaturalDocs.exe \$@
        EOF
        chmod +x $out/bin/NaturalDocs
    '';

    meta = {
        homepage = "https://www.naturaldocs.org";
        description = "Natural Docs source code documentation system";
        mainProgram = "NaturalDocs";
    };
}
