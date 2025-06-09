{ pkgs, ... }:

let 
  # astal = pkgs.callPackage ../flakes/astal/package.nix {};
  mojo = pkgs.callPackage ../flakes/mojo/package.nix {};
  minizincide = pkgs.libsForQt5.callPackage ../flakes/minizinc/ide.nix {};


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
    nerd-fonts.jetbrains-mono
    nerd-fonts.monaspace
  ];


  # Programs, not pkgs
  programs = {

    # wireshark.enable = true;
    ssh.startAgent = true;

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  environment.systemPackages = [
    # astal
    mojo
    minizincide
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
