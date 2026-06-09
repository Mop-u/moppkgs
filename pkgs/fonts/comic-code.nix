{
  stdenvNoCC,
  unzip,
  requireFile,
}:
stdenvNoCC.mkDerivation {
  name = "comic-code";
  dontConfigure = true;
  nativeBuildInputs = [ unzip ];
  src = requireFile {
    name = "ILT-230530-b9fd4ab.zip";
    url = "https://fonts.ilovetypography.com/account/orders#ILT-230530-b9fd4ab";
    hash = "sha256-nHX+9TEO8c9TyCSYnV5izHJv3G6mW5p2KAAWqgYNvOg=";
  };
  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp ./Comic\ Code/OTF/* $out/share/fonts/opentype/
  '';
  meta = {
    description = "A monospaced adaptation of the most infamous yet most popular casual font.";
  };
}
