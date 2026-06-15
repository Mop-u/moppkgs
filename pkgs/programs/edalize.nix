{
  python3Packages,
  fetchFromGitHub,
}:
python3Packages.edalize.overridePythonAttrs (old: rec {
  version = "0.6.7";
  src = fetchFromGitHub {
    owner = "olofk";
    repo = "edalize";
    rev = "v${version}";
    hash = "sha256-o+cwcW1A+EfIGNu3/Ufnr7D2we4U6i0SLg21CTBYaZ4=";
  };
})
