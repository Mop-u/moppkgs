{
  boost187,
  catch2_3,
  cmake,
  cpptrace,
  fetchFromGitHub,
  fetchgit,
  fmt,
  mimalloc,
  python3,
  stdenv,
  tomlplusplus,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "slang-server";
  version = "0.2.9";
  src = fetchgit {
    url = "https://github.com/hudson-trading/slang-server";
    rev = "v${finalAttrs.version}";
    hash = "sha256-6Lc9rS8FEUSYcr2ulRqez7Of3awsxw3T6DsvZr9sVWI=";
    fetchSubmodules = true;
  };
  nativeBuildInputs = [
    boost187
    catch2_3
    cmake
    cpptrace
    mimalloc
    python3
    tomlplusplus
    (fmt.overrideAttrs (
      final: prev: {
        version = "12.2.0";
        src = fetchFromGitHub {
          owner = "fmtlib";
          repo = "fmt";
          rev = final.version;
          hash = "sha256-Tc7PmNxUv7ajw6GaHPGEEtrD/fl6is7RB8TPestJa1o=";
        };
      }
    )).dev
  ];
  cmakeFlags = [
    "-DCMAKE_DISABLE_FIND_PACKAGE_fmt=0"
    "-DSLANG_SERVER_INCLUDE_TESTS=0"
    "-DSLANG_USE_SYSTEM_FMT=1"
    "-DSLANG_USE_SYSTEM_BOOST=1"
  ];
  patches = [ ./findfmt.patch ];
  CXXFLAGS = [
    "-Wno-error=maybe-uninitialized"
  ];
  meta = {
    homepage = "https://hudson-trading.github.io/slang-server";
    description = "A high-performance LSP implementation for SystemVerilog, built on top of the Slang frontend";
    mainProgram = "slang-server";
  };
})
