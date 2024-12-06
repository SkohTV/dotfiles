{ fdupes
, buildFHSEnv
, lib
, stdenvNoCC
, requireFile
, unzip
}:


let
  package = stdenvNoCC.mkDerivation rec {
    pname = "stm32cubeide";
    version = "1.17.0";

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
      mkdir -p $out/{bin,opt,tmp,share/applications}
      unzip $src -d $out/tmp
      cd $out/tmp
      sh *.sh --quiet --noexec --nox11

      cd $out/tmp/makeself_dir_*
      sh ./desktop_shortcut.sh "${version}" "$out/opt" "$out/share/applications/stm32cubeide.desktop"
      find . -type f ! -name '*.tar.gz' -delete
      tar zxf *.tar.gz
      rm *.tar.gz

      mv * $out/opt

      # echo "(cd $out/opt && ./stm32cubeide)" > $out/bin/stm32cubeide # for X11
      echo "(cd $out/opt && ./stm32cubeide_wayland)" > $out/bin/stm32cubeide # for wayland

      chmod +x $out/bin/stm32cubeide
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
      ln -s ${package}/share/icons $out/share
      cp -r ${package}/share/applications $out/share
    '';
    
}
