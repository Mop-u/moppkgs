{
  lib,
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule (finalAttrs: {
  pname = "dnsfmt";
  version = "0.8.0";
  src = fetchFromGitHub {
    owner = "miekg";
    repo = finalAttrs.pname;
    tag = "v${finalAttrs.version}";
    hash = "sha256-9bAifsK6LO/ouV1ChyzhVmiN5MLQ18m9nViPD37QwGc=";
  };
  vendorHash = "sha256-DWrHwr+hc9JEKBlUMuGJFKzSzJ57zzjsX+1P3XZk92I=";
  doCheck = false;
  meta = {
    description = "Auto-format for DNS zone files";
    mainProgram = "dnsfmt";
    homepage = "https://github.com/miekg/dnsfmt";
    license = lib.licenses.gpl3;
  };
})
