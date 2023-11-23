{ config, pkgs, ... }: {


  ### DEFINE CORE OF NIXOS

  imports = [
    /etc/nixos/hardware-configuration.nix # Include the results of the hardware scan
    (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master") # Vscode server
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w" # For github desktop
  ];

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable programms
  programs.hyprland.enable = true;
  programs.zsh.enable = true;

  # Enable services
  services.upower.enable = true;
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.vscode-server.enable = true;
  services.xserver = {
    enable = true;
    autorun = false;
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      defaultSession = "none+i3";
      startx.enable = true;
    };
    windowManager.i3 = {
      enable = true;
    };
  };

  ### DEFINE USER ENVIRONNEMENT

  users.defaultUserShell = pkgs.zsh;
  environment.etc."zsh/zplug.zsh".source = "${pkgs.zplug}/share/zplug/init.zsh";
  environment.pathsToLink = [ "/libexec" ];

  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.qlpth = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    useDefaultShell = true;
    packages = with pkgs; [
      # New DE / WM
      i3
      picom
      feh

      # DE / WM
      hyprpaper
      wl-clipboard
      sway-contrib.grimshot
      swayimg
      dunst

      # GUI
      wofi
      alacritty
      brave
      discord
      obsidian
      github-desktop
      ytmdesktop
      xdg-utils # For embedded file manager

      # Screensharing
      pipewire
      wireplumber
      xdg-desktop-portal-hyprland
      grim
      slurp
    ];
  };

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    # For eww
    eww
    cava # eww
    upower # eww
    brightnessctl # eww
    redshift # eww
    sysstat # eww
    lm_sensors # eww
    gammastep # eww
    geoclue2 # eww
    coreutils-prefixed # eww

    # Cli tools
    wget
    networkmanager
    git
    zip
    unzip
    
    zsh
    exa
    bat
    starship
    ripgrep
    jq
    bluez

    # TUI
    neovim
    btop
    pipr
    zellij
    lf
    gitui

    # Utils
    #openssl
    openssh
    zplug


    # Languages
    efm-langserver # general purpose lsp

    # lua 5.4
    lua5_4_compat
    lua54Packages.luarocks # Luarocks package manager
    lua-language-server # lua lsp
    stylua # Lua formatter
    lua54Packages.luacheck # Lua linter
    
    # python 3.12
    python312
    nodePackages.pyright # Python lsp
    ruff # Python formatter
    pylint # Python linter

    # C & C++
    gnat13 # gcc & g++
    #gnumake # make
    #cmake # cmake
    clang-tools_16 # clangd (+ clang-tidy & clang-format)

    # Rust
    rustc # Rust core
    cargo # Rust core 
    rust-analyzer # Rust lsp
    rustfmt # Rust formatter
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # For postgresql
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "mydatabase" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };


  ### NETWORK

  # Enable nmcli
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  # Firewall setup
  networking.firewall.enable = false;

  # Setup httpd
  services.httpd.enable = true;
  services.httpd.enablePHP = true;
  services.httpd.virtualHosts."php.localhost" = {
    documentRoot = "/var/www/phplocalhost";
    #hostName = "php.chad.fr";
  };
  networking.extraHosts =
  ''
    127.0.0.1 php.localhost
  '';

  ## Nvidia
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  hardware.nvidia.prime = {
    sync.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };





  ### END

  system.copySystemConfiguration = true;
  system.stateVersion = "23.05";  
}   
