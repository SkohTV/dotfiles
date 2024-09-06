{ pkgs, ... }:
{

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


  # Programs, not in pkgs
  programs = {
    wireshark.enable = true;
    zsh.enable = true;
    ssh.startAgent = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };


  # Import pkgs sets
  imports = [
    ./pkgsets/desktop.nix # Desktop environement
    ./pkgsets/apps.nix # Graphical apps
    ./pkgsets/cli.nix # Command line tools / TUI
    ./pkgsets/langs.nix # For programming languages
    ./pkgsets/unstable.nix # Packages not on stable branch
 ];
}
