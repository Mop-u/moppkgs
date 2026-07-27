{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "leaf-markdown";
  version = "1.26.2";
  src = fetchFromGitHub {
    owner = "RivoLink";
    repo = "leaf";
    tag = finalAttrs.version;
    hash = "sha256-i56BfHHkWl6gfhYXhrwEymlPTc+V4msnxlV7LSUy8X0=";
  };
  cargoHash = "sha256-/IGQ0UTvQGU4KQKl5mocGeGEDx4AdMQQTv4B3bkpIJ0=";
  meta = {
    mainProgram = "leaf";
    description = "Terminal Markdown previewer";
    homepage = "https://leaf.rivolink.mg";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
