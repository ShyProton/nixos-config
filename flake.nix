{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Applications.
    nixvim = {
      url = github:pta2002/nixvim;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = github:hyprwm/Hyprland;
    hyprwm-contrib.url = github:hyprwm/contrib;

    # Utilities.
    impermanence.url = github:nix-community/impermanence;

    agenix = {
      url = github:ryantm/agenix;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = github:the-argus/spicetify-nix;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = github:misterio77/nix-colors;
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    rec {
      # TODO: If possible, abstract the creation of nixosSystem(s) by
      # defining a list of machine names and making one for each.

      templates = import ./templates;

      nixosConfigurations = rec {
        vbox = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/vbox # System module
          ];
        };

        alphonse = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/alphonse # System module
          ];
        };
      };
    };
}
