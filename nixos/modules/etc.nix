{ ... }:
{

  time.timeZone = "Europe/Paris"; # Set your time zone.
  virtualisation.docker.enable = true; # Docker
  documentation.dev.enable = true; # Man pages
  security.polkit.enable = true; # Enable polkit
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Hyprland fix zoom

  nix.settings.trusted-users = [ "root" "skoh" ];

  # Better
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
      symbolsFile = ../../xkb/symbols/custom-qwerty.xkb;
    };
  };

  # Customize sleep
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=2700s
  '';
}
