{
  lib,
  writeText,
  fetchFromGitHub,
  python3Packages,
}:
python3Packages.buildPythonPackage (
  finalAttrs:
  let
    src = fetchFromGitHub {
      owner = "meeb";
      repo = finalAttrs.pname;
      tag = "v${finalAttrs.version}";
      hash = "sha256-j370Kn95CQuGjwOoFMXNNQZ5odlR/0uiw02hN/UVAb8=";
    };
  in
  {
    inherit src;
    pname = "bandcampsync";
    version = "0.8.0";
    dependencies = with python3Packages; [
      beautifulsoup4
      curl-cffi
    ];
    patches = [
      (writeText "patch-ignore-tempalate.patch" ''
        diff --git a/bandcampsync/ignores.py b/bandcampsync/ignores.py
        index 4247c7d..d2dea23 100644
        --- a/bandcampsync/ignores.py
        +++ b/bandcampsync/ignores.py
        @@ -4,7 +4,7 @@ import shutil
         from .logger import get_logger


        -TEMPLATE_IGNORES_FILE = "/ignores.template.txt"
        +TEMPLATE_IGNORES_FILE = "${src}/ignores.template.txt"
         # A comment containing 10 or more equals signs,
         # used to delimit user-entered data with ids from the last run
         DELIMITER_REGEX = re.compile(r"^#\s*={10,}\s*$")
      '')
    ];
    pyproject = true;
    build-system = [ python3Packages.setuptools ];
    meta = {
      description = "Downloads your Bandcamp purchases automatically";
      mainProgram = finalAttrs.pname;
      homepage = "https://github.com/meeb/bandcampsync";
      license = lib.licenses.bsd3;
    };
  }
)
