{ ... }:

{


  # Imports
  imports = [

    # Hardware
    ./modules/hardware/hardware-configuration.nix # hardware config
    ./modules/hardware/fingerprint.nix # fingerprint config

    # User made
    ./modules/user/obsidian-daily-commit.nix # Daily obsidian github commit

    # Other
    ./modules/pkgs.nix # All packages
    ./modules/etc.nix # All config stuff remaining
  ];


  # Enable experimental features (nix subcommands, flakes...)
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];


  # Do not touch
  system.stateVersion = "24.11";
}

