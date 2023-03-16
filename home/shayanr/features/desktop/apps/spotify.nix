{ inputs, config, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModule
  ];

  home = {
    packages = with pkgs; [ playerctl ];
    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/spotify"
    ];
  };

  xdg.desktopEntries.spotify = {
    name = "Spotify";
    genericName = "Music Player";
    exec = "spotifywm";
    terminal = false;
    categories = [ "Application" ];
    icon = "Papirus"; # TODO: Set icon properly.
  };

  programs.spicetify = {
    enable = true;
    spotifyPackage = pkgs.spotifywm;
    theme = spicePkgs.themes.Onepunch;
    colorScheme = "dark";
  };

  services.playerctld.enable = true;
}
