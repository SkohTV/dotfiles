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


  ###################
  #----- USERS -----#
  ###################

  # ffmpeg capabilities group (for SRT)
  security.wrappers.ffmpeg = {
    owner = "root";
    group = "root";
    capabilities = "cap_sys_admin+ep";
    source = "${pkgs.ffmpeg}/bin/ffmpeg";
  };

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
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
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

  security.rtkit.enable = true;


  services.pipewire = {

    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;

    # Stop the bluetooth switch profile problem
    wireplumber.configPackages = [
      (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/11-bluetooth-policy.conf" ''
        wireplumber.settings = { bluetooth.autoswitch-to-headset-profile = false }
        monitor.bluez.properties = { bluez5.roles = [ a2dp_sink a2dp_source ] }
      '')
    ];

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
    wireguard.enable = true;
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
