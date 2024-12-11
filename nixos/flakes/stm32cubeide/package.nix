{ buildFHSEnv
, lib
, stdenvNoCC
, requireFile
, unzip
, makeDesktopItem
}:


let
  package = stdenvNoCC.mkDerivation rec {
    pname = "stm32cubeide";
    version = "1.17.0";

    src = requireFile {
      name = "packed.sh.zip";
      hash = "sha256-eDxCZpXe8YSlApQUn6kpsZqcqpea6l4jRh2N9VKDxzI=";
      message = ''
Unfortunately we cannot auto-download this file, so you have to get it yourself

-> https://www.st.com/en/development-tools/stm32cubeide.html
Please download the 1.17.0 release of the Generic Linux Installer
Then run `mv en.st-stm32cubeide_1.17.0_* packed.sh.zip && nix store add-file packed.sh.zip`
'';
    };

    nativeBuildInputs = [ unzip ];

    desktopItem = makeDesktopItem {
      name = "STM32CubeIde";
      exec = "stm32cubeide";
      desktopName = "STM32CubeIDE";
      categories = [ "Development" ];
      icon = "stm32cubeide";
      comment = meta.description;
      terminal = false;
      startupNotify = false;
    };

    buildCommand = ''
      mkdir -p $out/{bin,opt,tmp,share/applications}
      unzip $src -d $out/tmp
      cd $out/tmp
      sh *.sh --quiet --noexec --nox11

      cd $out/tmp/makeself_dir_*
      find . -type f ! -name '*.tar.gz' -delete
      tar zxf *.tar.gz
      rm *.tar.gz

      mv * $out/opt

      # echo "(cd $out/opt && ./stm32cubeide)" > $out/bin/stm32cubeide # for X11
      echo "(cd $out/opt && ./stm32cubeide_wayland)" > $out/bin/stm32cubeide # for wayland

      chmod +x $out/bin/stm32cubeide
      cp "${desktopItem}/share/applications/*.desktop" "$out/share/applications"
    '';

    meta = with lib; {
      description = "An all-in-one multi-OS development tool, which is part of the STM32Cube software ecosystem.";
      longDescription = ''
        STM32CubeIDE is an advanced C/C++ development platform with
        peripheral configuration, code generation, code compilation,
        and debug features for STM32 microcontrollers and microprocessors.
        It is based on the Eclipse®/CDT™ framework and GCC toolchain for
        the development, and GDB for the debugging. It allows the integration
        of the hundreds of existing plugins that complete the features of the Eclipse® IDE.
      '';
      homepage = "https://www.st.com/en/development-tools/stm32cubeide.html";
      sourceProvenance = with sourceTypes; [ binaryBytecode ];
      license = licenses.unfree;
      maintainers = with maintainers; [ skohtv ];
      platforms = [ "x86_64-linux" ];
    };

  };


in
  buildFHSEnv {
    inherit (package) pname version meta;

    runScript = "${package.outPath}/bin/stm32cubeide";

    targetPkgs = pkgs:
      with pkgs; [
        glib
        gtk3
        xorg.libXtst
    ];

    extraInstallCommands = ''
      mkdir -p $out/share
      # ln -s ${package}/share/icons $out/share
      cp -r ${package}/share/applications $out/share
    '';
}
