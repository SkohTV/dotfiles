{ pkgs, ... }:

let 
  # astal = pkgs.callPackage ../../flakes/astal/package.nix {};
  # minizincide = pkgs.libsForQt5.callPackage ../../flakes/minizinc/ide.nix {};
  mojo = pkgs.callPackage ../../flakes/mojo/package.nix {};
  # vivify = pkgs.callPackage ../../flakes/vivify/package.nix {};
  # opencilk = pkgs.callPackage ../../flakes/opencilk/package.nix {};


in {

  # Packages config
  nixpkgs.config = {
    # allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = ["electron-25.9.0" "nix-2.16.2"];
  };


  # Fonts, not in pkgs
  fonts = {
    fontconfig.enable = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.monaspace
      noto-fonts-cjk-sans # Chinese / japanese for chrome
    ];
  };
  


  # Programs, not pkgs
  programs = {
    nh.enable = true;
    obs-studio.enable = true;
    ssh.startAgent = true;
    hyprland = { enable = true; xwayland.enable = true; };
  };



  environment.systemPackages = [
    #############################
    #----- CUSTOM PACKAGES -----#
    #############################

    # astal
    # minizincide
    mojo
    # vivify
    # opencilk

  ] ++ (with pkgs; [


    ############################
    #----- GRAPHICAL APPS -----#
    ############################

    alacritty
    obsidian 
    parsec-bin
    brave
    discord
    vlc 
    zoom-us # Sadge af

    kdePackages.okular
    qalculate-gtk
    onlyoffice-desktopeditors

    xdg-utils # For embedded file manager


    ######################
    #----- CLI APPS -----#
    ######################

    ### Man pages
    man-pages
    man-pages-posix

    ### Files
    zip
    unzip

    ### Core
    wget # download file
    file # file information
    bluez # bluetooth daemon
    bluetuith # bluetooth tui
    networkmanager # wifi connection
    steam-run # for fhs required apps
    imagemagick # for image manipulation
    ffmpeg # for video manipulation

    ### Advanced
    perf # for bpfilter
    starship
    hyperfine
    fzf
    jq
    gh

    ### Improved
    eza # ls
    bat # cat
    ripgrep # grep
    zoxide # cd

    ### Terminal User Interface
    btop # ressource monitor
    zellij # terminal multiplexer
    lazygit # git interface
    mprocs # long running process manager

    ### Utils
    pkg-config # for cmake
    openssl # ssl
    openssh # ssh

    home-manager


    ###################
    #----- DE/WM -----#
    ###################

    ### Hypr
    hyprpaper # wallpaper
    hypridle # sleep
    hyprlock # lock
    hyprcursor # cursor
    hyprsunset # blue light

    ### Tools
    wlogout # gui logout menu
    tofi # program launcher
    dunst # notification daemon
    imv # image viewer
    libnotify # send notifs
    acpi # get battery remaining

    grim # screenshot tool
    slurp # screenshot tool
    wl-clipboard # clipboard
    wl-clip-persist # clipboard

    ### Utils
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk

    ### Ags (bar)
    sassc # compile css 
    brightnessctl # change brightness
    cava # small bars for sound
    sysstat # show cpu %
    lm_sensors # show temp 


    ###################
    #----- LANGS -----#
    ###################

    lua5_4_compat

    python313
    poetry

    gnat13
    gnumake 
    cmake

    rustc
    cargo

    zig

    nodejs
    bun

    temurin-bin

    protobuf


    ####################
    #----- NEOVIM -----#
    ####################

    neovim

    tree-sitter

    lua5_4_compat
    lua54Packages.luarocks
    lua-language-server

    pyright
    rust-analyzer
    nixd
    zls

    bash-language-server
    shellcheck
    shfmt

    nodePackages_latest.typescript-language-server
    rPackages.languageserver
    jdt-language-server
    cmake-language-server

    llvmPackages.openmp
    clang-tools
    vscode-langservers-extracted # for json, css & html

  ]);

}
