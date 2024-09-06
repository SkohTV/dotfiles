{ config, ... }:
{

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Docker
  virtualisation.docker.enable = true;

  # Man pages
  documentation.dev.enable = true;

  # Enable polkit
  security.polkit.enable = true;

  # Hyprland fix zoom
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
