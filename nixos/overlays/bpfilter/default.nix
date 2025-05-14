{
stdenv,
lib,

cmake,
git,
pkg-config,
libbpf,
libnl,
bison,
flex,
doxygen,
lcov,
sphinx,
cmocka,
clang-tools,
gbenchmark,
libgit2
}:


stdenv.mkDerivation {
  pname = "bpfilter";
  version = "1.0.0";

  src = ./bpfilter;

  nativeBuildInputs = [
    cmake
    git
    pkg-config
    libbpf
    libnl
    bison
    flex
    doxygen
    lcov
    sphinx
    cmocka
    clang-tools
    gbenchmark
    libgit2
  ];
}
