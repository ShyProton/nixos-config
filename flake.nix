{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Applications.
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Utilities.
    impermanence.url = "github:nix-community/impermanence";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;

    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    nixos-system = system-module:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs outputs;};
        modules = [
          system-module
        ];
      };
  in {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    templates = import ./templates;

    formatter.${system} = pkgs.alejandra;

    nixosConfigurations = {
      vbox = nixos-system ./hosts/vbox;
      alphonse = nixos-system ./hosts/alphonse;
      mob = nixos-system ./hosts/mob;
    };
  };
}
