{
  fetchFromGitHub,
  lib,
  gcc,
  glibc,
  makeWrapper,
  clangStdenv,
  libcxx,
  libgcc,
  zlib,
  libxml2,
  autoPatchelfHook,
}:

clangStdenv.mkDerivation (finalAttrs: {
  pname = "opencilk";
  version = "3.0.0";

  src = fetchFromGitHub {

  }


  nativeBuildInputs = [
    makeWrapper
    autoPatchelfHook
    libcxx
    libgcc
    zlib
  ];

  buildInputs = [
    glibc
  ];

  preFixup = ''
    # Fix libxml2 breakage. See https://github.com/NixOS/nixpkgs/pull/396195#issuecomment-2881757108
    mkdir -p "$out/lib"
    ln -s "${lib.getLib libxml2}/lib/libxml2.so" "$out/lib/libxml2.so.2"
  '';

  installPhase = ''
    mkdir -p $out
    cp -r * $out/
    gcc_toolchain=${gcc}
    gcc_libdir=$(dirname $(${gcc}/bin/gcc -print-libgcc-file-name))
    glibc_include=${glibc.dev}/include
    glibc_lib=${glibc}/lib

    for bin in $out/bin/clang $out/bin/clang++ $out/bin/clang-cpp; do
      if [ -f "$bin" ]; then
        wrapProgram $bin \
          --add-flags "--gcc-toolchain=$gcc_toolchain \
                       -B$gcc_libdir -L$gcc_libdir \
                       -isystem $glibc_include -L$glibc_lib \
                       -isystem $cxx_include \
                       -isystem $cxx_include_sys"
      fi
    done
  '';

  meta = with lib; {
    description = "OpenCilk compiler suite (binary build for Ubuntu, fixed for NixOS)";
    longDescription = ''
      OpenCilk is an open-source platform that makes parallel programming a simple extension of serial programming.
    '';
    homepage = "https://www.opencilk.org/";
    license = with licenses; [
      asl20
      llvm-exception
    ];
    platforms = platforms.linux;
  };
})
