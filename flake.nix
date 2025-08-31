{
  description = "My personal flake!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixi = lib.nixosSystem rec {
        specialArgs = {inherit inputs;};

        system = "x86_64-linux";

        modules = [
          ./configuration.nix
          #{
          #environment.systemPackages = [inputs.alejandra.defaultPackage.${system}
          #  nixpkgs.legacyPackages.git];
          #}
        ];
      };
    };
  };
}
