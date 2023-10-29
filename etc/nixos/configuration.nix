# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:
{
  imports =
  [ # Include the results of the hardware scan
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true:
  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;
  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {

  # font = "Lat2-Terminus16";
  # keyMap = "us";
  # useXkbConfig = true; # use xkbOptions in tty.
  # };
  
  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.qlpth = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    useDefaultShell = true;
    packages = with pkgs; [
        xdg-utils # For embedded file manager
        brave
        discord
        obsidian
        alacritty
        wofi
        eww-wayland
        cava
        hyprpaper
    ];
  };

  programs.hyprland.enable = true; # For hyprland
  programs.zsh.enable = true;
  services.upower.enable = true;
  services.openssh.enable = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    networkmanager
    git
    zsh
    zip
    unzip
    starship
    exa
    bat
    upower
    ripgrep
    brightnessctl
    redshift
    sysstat # for eww
    lm_sensors # also
    jq
    openssh
    coreutils-prefixed
    neovim
    gammastep
    geoclue2
    btop
    antigen
    gitui
    zellij
];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable nmcli
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system  # (/run/current-system/configuration.nix). This is useful in case you    # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions    # on your system were taken. It's perfectly fine and recommended to leave  # this value at the release version of the first install of this system.   # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).         system.stateVersion = "23.05"; # Did you read the comment?
  system.stateVersion = "23.05";  
}   
