{
  description = "Template Rust project";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;

    naersk = {
      url = github:nix-community/naersk;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, naersk }:
    let
      inherit (nixpkgs.lib) genAttrs systems;
      manifest = (nixpkgs.lib.importTOML ./Cargo.toml).package;

      forAllSystems = genAttrs systems.flakeExposed;
      pkgsFor = forAllSystems (system: import nixpkgs {
        inherit system;
        overlays = [ self.overlays.default ];
      });
    in
    rec {
      overlays = rec {
        default = final: prev: {
          crate = prev.callPackage ./. { inherit naersk; };
        };
      };

      packages = forAllSystems (system:
        let pkgs = pkgsFor.${system}; in
        rec {
          inherit (pkgs) crate;
          default = crate;
        });

      devShells = forAllSystems (system:
        let pkgs = pkgsFor.${system}; in
        rec {
          crate = pkgs.mkShell {
            inputsFrom = [ pkgs.crate ];
            buildInputs = with pkgs; [
              rustc
              rustfmt
              cargo
              cargo-edit
              clippy
            ];
          };
          default = crate;
        });
    };
}
