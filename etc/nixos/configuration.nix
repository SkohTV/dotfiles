{
  config,
  pkgs,
  ...
}: {
  ### DEFINE CORE OF NIXOS

  imports = [
    /etc/nixos/hardware-configuration.nix # Include the results of the hardware scan
  ];

  # Otherwise the following packages don't compile
  nixpkgs.config.permittedInsecurePackages = ["electron-25.9.0" "nix-2.16.2"];

  # Enable experimental features (nix subcommands, flakes...)
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages (for nvidia)
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Enable sound. (& screensharing)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable programs
  programs.zsh.enable = true;
  programs.ssh.startAgent = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Docker
  virtualisation.docker.enable = true;

  # Enable services
  services.upower.enable = true;
  services.openssh.enable = true;

  # Power saving & management
  powerManagement.enable = true;
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

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  };

  # Man pages
  documentation.dev.enable = true;

  # Enable polkit
  security.polkit.enable = true;


  ### DEFINE USER ENVIRONNEMENT

  users.defaultUserShell = pkgs.zsh;
  environment.etc."zsh/zplug.zsh".source = "${pkgs.zplug}/share/zplug/init.zsh";
  environment.pathsToLink = ["/libexec"];

  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.qlpth = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker"]; # Enable ‘sudo’ for the user.
    useDefaultShell = true;
    packages = with pkgs; [
      # DE / WM
      hyprpaper
      tofi
      dunst

      # spectrwm
      xsecurelock
      xclip
      flameshot

      # GUI
      alacritty
      brave
      tor-browser
      discord
      obsidian
      ytmdesktop
      libsForQt5.okular
      zathura
      qalculate-gtk
      xdg-utils # For embedded file manager
      ciscoPacketTracer8
      wireshark
      vlc
    ];
  };

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    # Man pages
    man-pages
    man-pages-posix

    # For eww
    eww-wayland
    pamixer # eww
    cava # eww
    lm_sensors # eww
    acpi # eww
    brightnessctl # eww # TO REPLACE
    redshift # eww ( $ redshift -P -O 6000 ) # TO REPLACE

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
    zoxide

    # TUI
    neovim
    btop
    pipr
    zellij
    lf
    lazygit
    asciiquarium
    fzf
    sd
    fd
    hyperfine
    procs
    mprocs

    # Utils
    #openssl
    openssh
    zplug

    # Languages
    efm-langserver # general purpose lsp

    lua5_4_compat # Lua core
    lua54Packages.luarocks # Luarocks package manager
    lua-language-server # Lua lsp
    stylua # Lua formatter
    lua54Packages.luacheck # Lua linter

    python312 # Python core
    nodePackages_latest.pyright # Python lsp
    ruff # Python formatter

    gnat13 # C / C++ core (gcc & g++)
    gnumake # make
    cmake # cmake
    clang-tools_16 # clangd (+ clang-tidy & clang-format)

    rustc # Rust core
    cargo # Rust core
    rust-analyzer # Rust lsp
    rustfmt # Rust formatter

    php82 # Php core
    php82Extensions.pgsql # Php + Postgres
    php82Packages.composer # Php package manager
    phpactor # Php lsp

    nixd # Nix lsp
    statix # Nix linter

    nodejs_21 # JS core
    typescript # TS core (for tsserver)
    nodePackages_latest.typescript-language-server # TS / JS lsp
    eslint_d # JS linter
    prettierd # JS formatter
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    # (nerdfonts.override { fonts = [ "Monaspace" ];     })
  ];

  # For postgresql
  services.postgresql = {
    enable = true;
    ensureDatabases = ["mydatabase"];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            trust
      host    all             all             ::1/128                 trust
    '';
  };
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
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
  networking.extraHosts = ''
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

