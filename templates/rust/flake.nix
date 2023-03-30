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
      packages = forAllSystems (system: rec {
        crate = naersk.lib."${system}".buildPackage {
          inherit (manifest) version;
          pname = manifest.name;
          root = nixpkgs.lib.cleanSource ./.;
        };
        default = crate;
      });

      devShells = forAllSystems (system:
        let pkgs = pkgsFor.${system};
        in
        {
          crate = pkgs.mkShell {
            inputsFrom = [ pkgs.crate ];
            buildInputs = with pkgs; [
              cargo
              cargo-edit
            ];
          };
        });
    };
}
