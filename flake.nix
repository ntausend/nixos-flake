{
  description = "My personal flake!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
  in {
    #homeConfigurations."emtpy" = home-manager.lib.homeManagerConfiguration

    nixosConfigurations = {
      nixi = lib.nixosSystem rec {
        specialArgs = {inherit inputs;};

        system = "x86_64-linux";

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          #{
          #environment.systemPackages = [inputs.alejandra.defaultPackage.${system}
          #  nixpkgs.legacyPackages.git];
          #}
        ];
      };
    };
  };
}
