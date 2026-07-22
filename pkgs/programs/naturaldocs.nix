{
  buildDotnetModule,
  dotnetCorePackages,
  fetchFromGitHub,
  sqlite,
  stdenv,
}:

buildDotnetModule (finalAttrs: {
  pname = "naturaldocs";
  version = "2.4-beta1";

  src = fetchFromGitHub {
    name = "${finalAttrs.pname}-${finalAttrs.version}-source";
    owner = "NaturalDocs";
    repo = "NaturalDocs";
    rev = "Version_2.4_Beta_1";
    hash = "sha256-7KJeJCTfeCUeOWg9s3X/LoV0YDZz5g0Mg51KI47AHR0=";
  };
  projectFile = "CLI/CLI.csproj";
  dotnet-sdk = dotnetCorePackages.sdk_10_0;
  dotnet-runtime = dotnetCorePackages.runtime_10_0;
  runtimeDeps = [ sqlite ];
  dotnetFlags = [
    "-property:Platform=${
      {
        "aarch64-darwin" = "macOS_ARM64";
        "aarch64-linux" = "Linux_ARM64";
        "x86_64-darwin" = "macOS_x64";
        "x86_64-linux" = "Linux_x64";
      }
      .${stdenv.hostPlatform.system}
    }"
  ];
  meta = {
    homepage = "https://www.naturaldocs.org";
    description = "Natural Docs source code documentation system";
    mainProgram = "NaturalDocs";
  };
})
