{ fdupes
, buildFHSEnv
, fetchzip
, icoutils
, imagemagick
, jdk17
, lib
, makeDesktopItem
, stdenvNoCC
}:


let
  package = stdenvNoCC.mkDerivation rec {
    pname = "stm32cubeide";
    version = "1.16.1";

    src = fetchzip {
      url = "https://www.st.com/content/ccc/resource/technical/software/sw_development_suite/group1/16/f0/7b/d1/a5/6d/42/66/stm32cubeide-lnx/files/st-stm32cubeide_1.16.1_22882_20240916_0822_amd64.sh.zip/jcr:content/translations/en.st-stm32cubeide_1.16.1_22882_20240916_0822_amd64.sh.zip";
      hash = "sha256-sVIpuD+B8qB4dM062bY3GVGpzS/njBD9f08A//qm6CE=";
      stripRoot = false;
    };

    # nativeBuildInputs = [ fdupes icoutils imagemagick ];

    buildCommand = ''
      mkdir -p $out/bin
      cp jsp $out/bin
    '';
  };


in 
  buildFHSEnv {
    inherit (package) pname version meta;
    runScript = "${package.outPath}/bin/stm32cubeide";
    targetPkgs = pkgs:
      with pkgs; [
        alsa-lib
        at-spi2-atk
        cairo
        cups
        dbus
        expat
        glib
        gtk3
        libdrm
        libGL
        libudev0-shim
        libxkbcommon
        mesa
        nspr
        nss
        pango
        xorg.libX11
        xorg.libxcb
        xorg.libXcomposite
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXrandr
      ];
}
