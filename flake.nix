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

      nixos-system = system-module: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          system-module
        ];
      };
    in
    rec {
      templates = import ./templates;

      nixosConfigurations = rec {
        vbox = nixos-system ./hosts/vbox;
        alphonse = nixos-system ./hosts/alphonse;
        mob = nixos-system ./hosts/mob;
      };
    };
}
