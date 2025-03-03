{ pkgs, ... }:

let 
  # astal = pkgs.callPackage ../flakes/astal/package.nix {};


in {

  # Packages config
  nixpkgs.config = {

    # Allow unsecure packages
    permittedInsecurePackages = ["electron-25.9.0" "nix-2.16.2"];

    # Allow unfree packages (for nvidia)
    allowUnfree = true;
  };


  # Fonts, not in pkgs
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Monaspace" ]; })
  ];


  # Programs, not pkgs
  programs = {

    # wireshark.enable = true;
    zsh.enable = true;
    ssh.startAgent = true;

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  environment.systemPackages = [
    # astal
  ];


  # Import pkgs sets
  imports = [
    ./pkgsets/desktop.nix # Desktop environement
    ./pkgsets/apps.nix # Graphical apps
    ./pkgsets/cli.nix # Command line tools / TUI
    ./pkgsets/langs.nix # For programming languages
    ./pkgsets/nvim.nix # For nvim config
    ./pkgsets/unstable.nix # Packages not on stable branch
 ];
}
