{
  stdenv,
  fetchFromGitHub,
  freetype,
  pkg-config,
}:
stdenv.mkDerivation rec {
  pname = "ttf2psf";
  version = "v1.0.1";
  src = fetchFromGitHub {
    owner = "NateChoe1";
    repo = "ttf2psf";
    rev = version;
    hash = "sha256-usYrf0j+B6pWlqPm40Qbefa0UWLmkDqb/J6OsF68HIw=";
  };
  nativeBuildInputs = [
    freetype
    pkg-config
  ];
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share
    cp build/ttf2psf $out/bin/ttf2psf
    cp -r data $out/share/
    mv $out/share/data $out/share/ttf2psf
  '';

  meta = {
    homepage = "https://github.com/NateChoe1/ttf2psf";
    description = "his just converts files to psf format with freetype, nothing else.";
    mainProgram = "ttf2psf";
  };
}
