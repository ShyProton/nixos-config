{ config, pkgs, ... }:
let
  # TODO: figure out if glassfish can be used via interfacing with glassfish
  # home from the nix store. (Presumably impossible since it must be written to)
  glassfish = pkgs.stdenv.mkDerivation {
    name = "glassfish";
    version = "7.0.2";

    src = pkgs.fetchzip {
      url = "https://download.eclipse.org/ee4j/glassfish/glassfish-7.0.2.zip";
      sha256 = "sha256-IF7T5YUCwsG0pkNPLutNtiV7MrtKR7y3TdGXy6VlKpA=";
    };

    installPhase = ''
      mkdir $out
      mv * $out
    '';
  };
in
{
  home = {
    packages = with pkgs; [
      jetbrains.idea-ultimate
      jdk
      # glassfish
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/JetBrains"
      ".local/share/JetBrains"
      ".java"
      ".m2"
      ".gfclient" # Glassfish.
    ];
  };
}
