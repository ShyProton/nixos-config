{
  inputs,
  config,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
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
    enabledExtensions = with spicePkgs.extensions; [
      featureShuffle
      history
      beautifulLyrics
    ];
    theme = spicePkgs.themes.onepunch;
    colorScheme = "dark";
    windowManagerPatch = true;
  };

  services.playerctld.enable = true;
}
