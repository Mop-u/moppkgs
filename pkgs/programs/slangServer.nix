{
  stdenv,
  fetchgit,
  cmake,
  python3,
  mimalloc,
  boost187,
  tomlplusplus,
  catch2_3,
  cpptrace,
  fmt,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "slang-server";
  version = "0.2.7";
  src = fetchgit {
    url = "https://github.com/hudson-trading/slang-server";
    rev = "v${finalAttrs.version}";
    hash = "sha256-LHKfgs0YmrQMQ9cC8WAufqOUcatPYBudyX5tE8kWf3g=";
    fetchSubmodules = true;
  };
  nativeBuildInputs = [
    cmake
    python3
    mimalloc
    boost187
    tomlplusplus
    catch2_3
    cpptrace
    fmt.dev
  ];
  cmakeFlags = [
    "-DCMAKE_DISABLE_FIND_PACKAGE_fmt=0"
    "-DSLANG_SERVER_INCLUDE_TESTS=0"
  ];
  CXXFLAGS = [
    "-Wno-error=maybe-uninitialized"
  ];
  meta = {
    homepage = "https://hudson-trading.github.io/slang-server";
    description = "A high-performance LSP implementation for SystemVerilog, built on top of the Slang frontend";
    mainProgram = "slang-server";
  };
})
