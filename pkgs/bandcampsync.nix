{
  lib,
  fetchFromGitHub,
  python3Packages,
}:
python3Packages.buildPythonPackage (finalAttrs: {
  pname = "bandcampsync";
  version = "0.8.0";
  src = fetchFromGitHub {
    owner = "meeb";
    repo = finalAttrs.pname;
    tag = "v${finalAttrs.version}";
    hash = "sha256-j370Kn95CQuGjwOoFMXNNQZ5odlR/0uiw02hN/UVAb8=";
  };
  dependencies = with python3Packages; [
    beautifulsoup4
    curl-cffi
  ];
  pyproject = true;
  build-system = [ python3Packages.setuptools ];
  meta = {
    description = "Downloads your Bandcamp purchases automatically";
    mainProgram = finalAttrs.pname;
    homepage = "https://github.com/meeb/bandcampsync";
    license = lib.licenses.bsd3;
  };
})
