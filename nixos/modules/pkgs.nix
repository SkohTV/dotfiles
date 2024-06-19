{ ... }:
{
  # If required
  #nixpkgs.config.permittedInsecurePackages = ["electron-25.9.0" "nix-2.16.2"];

  # Import pkgs sets
  imports = [
    ./pkgsets/desktop.nix # Desktop environement
    ./pkgsets/apps.nix # Graphical apps
  ];
}
