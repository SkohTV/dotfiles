{ lib, pkgs, ... }:
{

  time.timeZone = lib.mkForce null; # Timezone is handled somewhere else
  virtualisation.docker.enable = true; # Docker
  documentation.dev.enable = true; # Man pages
  security.polkit.enable = true; # Enable polkit
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Hyprland fix zoom

  nix.settings.trusted-users = [ "root" "skoh" ];
  nix.settings.sandbox = true;

  # Optimize store at each build
  nix.settings.auto-optimise-store = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Add custom keyboard
  services.xserver.xkb.extraLayouts = {
    custom-qwerty = {
      description = "English (intl., with AltGr dead keys)";
      languages = [ "eng" ];
      symbolsFile = ../../../xkb/symbols/custom-qwerty.xkb;
    };
  };

  # Customize sleep
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=2700s
  '';

  # User config
  users.users.skoh = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker"]; # "wireshark"
    useDefaultShell = true;
  };


  ###################
  #----- POWER -----#
  ###################

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  services = {
    thermald.enable = true;
  };


  #####################
  #----- GREETER -----#
  #####################

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "greeter";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };

  # Remove error spam
  # https://www.reddit.com/r/NixOS/comments/15mrrez/tuigreet_configuration_for_hyprland/
  # https://github.com/sjcobb2022/nixos-config/blob/main/hosts/common/optional/greetd.nix
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";

    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  
  ########################
  #----- MULTIMEDIA -----#
  ########################

  # Necessary
  security.rtkit.enable = true;

  # Enable screensharing
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };


  #####################
  #----- NETWORK -----#
  #####################

  networking = {
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.wlp1s0.useDHCP = true;
    firewall.enable = false;
  };


  ######################
  #----- SERVICES -----#
  ######################

  services = {
    flatpak.enable = true; # Flatpaks
    upower.enable = true; # Power stuff
    openssh.enable = true; # ssh
    fwupd.enable = true; # framework update firmware
    automatic-timezoned.enable = true; # auto detect timezone
  };

}
