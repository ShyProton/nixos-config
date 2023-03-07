{ config, pkgs, ...}:
{
  home = {
    packages = with pkgs; [ spotifywm ];
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
}
