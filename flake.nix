{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Applications
    nixvim = {
      # HACK: Using revision before merge conflict introduced in PR #145.
      # Wait until PR #168 or #170 is merged.
      url = github:pta2002/nixvim?rev=c5d9ea91b588cbd1af771a9abd5c7bf4d1300db1;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = github:hyprwm/Hyprland;

    # Utilities
    impermanence.url = github:nix-community/impermanence;
    agenix = {
      url = github:ryantm/agenix;
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

      # TODO: Offload common configuration options to the common directories.
      nixosConfigurations = rec {
        vbox = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/vbox # System module
            # ./home/shayanr # Home module
          ];
        };

        alphonse = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/alphonse # System module
            # ./home/shayanr # Home module
          ];
        };
      };
    };
}
