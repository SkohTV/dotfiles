{ ... }:

{

  # Imports
  imports = [

    # Hardware
    ./modules/hardware/laptop-acer.nix # Include the results of the hardware scan
    ./modules/hardware/nvidia.nix # For the graphic card

    # Conf
    ./modules/conf/battery.nix # Battery 
    ./modules/conf/greet.nix # Greeter 
    ./modules/conf/multimedia.nix # Multimedia 
    ./modules/conf/network.nix # Network
    ./modules/conf/services.nix # Services

    # Specific
    ./modules/specific/tmp-web.nix # For web lessons

    # Other
    ./modules/user.nix # User config 
    ./modules/pkgs.nix # All packages
    ./modules/etc.nix # All config stuff remaining
  ];


  # Enable experimental features (nix subcommands, flakes...)
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];



  system.copySystemConfiguration = true;
  system.stateVersion = "23.11";

}

