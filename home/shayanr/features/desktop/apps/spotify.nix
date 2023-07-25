{
  inputs,
  config,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = [
    inputs.spicetify-nix.homeManagerModule
  ];

  home = {
    packages = with pkgs; [playerctl];
    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/spotify"
    ];
  };

  xdg.desktopEntries.spotify = {
    name = "Spotify";
    genericName = "Music Player";
    exec = "spotify";
    terminal = false;
    categories = ["Application"];
    icon = "spotify";
  };

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Onepunch;
    colorScheme = "dark";
    windowManagerPatch = true;
  };

  services.playerctld.enable = true;
}
