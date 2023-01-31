{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = github:hyprwm/Hyprland;
    impermanence.url = github:nix-community/impermanence;
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
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
