{
  description = "Application packaged using poetry2nix";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    poetry2nix,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (poetry2nix.lib.mkPoetry2Nix {inherit pkgs;}) mkPoetryApplication;

      myapp = mkPoetryApplication {projectDir = self;};
      dockerImage = pkgs.dockerTools.streamLayeredImage {
        name = "template";
        contents = [myapp];
        config.Cmd = ["template"]; # Poetry script to run.
      };
    in {
      packages = {
        inherit myapp dockerImage;
        default = self.packages.${system}.myapp;
      };

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [python3 poetry dive];
      };
    });
}
