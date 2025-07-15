{ inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };


  outputs = {nixpkgs, home-manager, nixos-hardware, ... }:
    let
      system = "x86_64-linux";

    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          nixos-hardware.nixosModules.framework-13-7040-amd
          ./config/configuration.nix
        ];
      };

      homeConfigurations.skoh = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./config/home.nix
        ];
      };

    };

}
