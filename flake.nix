{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in
    {
      homeConfigurations = {
        "shayanr@vbox" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/vbox.nix
          ];
        };
      };

      nixosConfigurations = {
        vbox = lib.nixosSystem {
          inherit system;
          modules = [
            home-manager.nixosModules.home-manager
            ./hosts/vbox
          ];
        };
      };
    };
}
