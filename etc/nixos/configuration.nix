{ config, pkgs, ... }: {


  ### DEFINE CORE OF NIXOS

  imports = [
    /etc/nixos/hardware-configuration.nix # Include the results of the hardware scan
    (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master") # Vscode server
  ];
  
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6"
  ];

  # Enable experimental features (nix subcommands, flakes...)
  nix.settings.experimental-features = [ "nix-command" ];

  # Allow unfree packages (for nvidia)
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
  programs.zsh.enable = true;
  #programs.ssh.startAgent = true;

  # Enable services
  services.upower.enable = true;
  services.openssh.enable = true;
  services.vscode-server.enable = true;
  services.xserver = {
    enable = true;
    autorun = false;
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      defaultSession = "none+spectrwm";
      startx.enable = true;
    };
    windowManager.spectrwm = {
      enable = true;
    };
  };

  powerManagement.powertop.enable = true;
  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
    };
  };
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
         turbo = "auto";
      };
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
      # DE / WM
      spectrwm
      xsecurelock
      dmenu
      xclip
      flameshot
      feh
      dunst
      picom

      # GUI
      alacritty
      brave
      discord
      obsidian
      ytmdesktop
      zathura
      xdg-utils # For embedded file manager
    ];
  };

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    # For eww
    eww
    cava # eww
    lm_sensors # eww
    brightnessctl # eww

    # Cli tools
    wget
    networkmanager
    git
    zip
    unzip

    eza
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
    asciiquarium

    # Utils
    #openssl
    openssh
    #zplug
    blesh


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
    gnumake # make
    cmake # cmake
    clang-tools_16 # clangd (+ clang-tidy & clang-format)

    # Rust
    rustc # Rust core
    cargo # Rust core 
    rust-analyzer # Rust lsp
    rustfmt # Rust formatter

    # Php
    php82 # Php core
    php82Extensions.pgsql # Php + Postgres
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    #(nerdfonts.override { fonts = [ "Monaspace" ]; })
  ];

  # For postgresql
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "mydatabase" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            trust
      host    all             all             ::1/128                 trust
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
  system.stateVersion = "23.11";  
}   
