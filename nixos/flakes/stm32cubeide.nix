{ fdupes
, buildFHSEnv
, fetchzip
, icoutils
, imagemagick
, jdk17
, lib
, makeDesktopItem
, stdenvNoCC
, requireFile
, unzip
}:


let
  package = stdenvNoCC.mkDerivation rec {
    pname = "stm32cubeide";
    version = "1.16.1";

    # src = fetchzip {
    #   url = "https://drive.usercontent.google.com/download?id=1Dbfw08AS_HCyWFCtShgujQ8ynXaLwrSA&export=download&confirm=t&uuid=5eb93a89-8564-4af5-8423-f9cd4caad7f6";
    #   hash = "";
    #   stripRoot = false;
    # };

    # Require user to `nix store add-file packed.sh.zip`
    src = requireFile {
      name = "packed.sh.zip";
      message = "WIP: Implement download, in the mean time, download it by your self";
      hash = "sha256-eDxCZpXe8YSlApQUn6kpsZqcqpea6l4jRh2N9VKDxzI=";
    };

    nativeBuildInputs = [ unzip ];

    buildCommand = ''
      mkdir -p $out/{bin,opt,tmp}
      unzip $src -d $out/tmp
      cd $out/tmp
      sh *.sh --quiet --noexec --nox11

      cd $out/tmp/makeself_dir_*
      find . -type f ! -name '*.tar.gz' -delete
      tar zxf *.tar.gz
      rm *.tar.gz

      mv * $out/opt
      echo "(cd $out/opt && ./stm32cubeide_wayland)" > $out/bin/stm32cubeide
      chmod +x $out/bin/stm32cubeide
    '';
  };


in 
  buildFHSEnv {
    inherit (package) pname version;
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
        jdk17
      ];
}
