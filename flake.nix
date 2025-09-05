{
  description = "My personal flake!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    #alejandra = {
    #  url = "github:kamadorueda/alejandra/4.0.0";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

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
    # this should be simpler and could be outsourced, as one could handle different systems in the flake by name.. TODO
    # one could also handle this with a default config and a module, which loads the settings
    globalSystemSettings = {
      system = "x86_64-linux";
      timezone = "Europe/Berlin";
      i18n = "de_DE.UTF-8";
    };
  in {
    nixosConfigurations = {
      macnix = lib.nixosSystem rec {
        specialArgs = {
          inherit inputs;
          inherit globalSystemSettings;
          hostname = "macnix";
        };

        system = globalSystemSettings.system;

        modules = [
          ./hosts/imac/configuration.nix
          home-manager.nixosModules.default
        ];
      };
    };
  };
}
