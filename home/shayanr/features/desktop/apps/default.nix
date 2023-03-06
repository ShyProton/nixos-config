{ pkgs, ... }:
{
  imports = [
    ./kitty.nix # Terminal emulator.
    ./firefox.nix # Web browser.
  ];

  home.packages = with pkgs; [
    audacity
    gimp
    spotifywm
  ];

  # TODO: Move this somewhere more appropriate. (spotify file)
  xdg.desktopEntries = {
    spotify = {
      name = "Spotify";
      genericName = "Music Player";
      exec = "spotifywm";
      terminal = false;
      categories = [ "Application" ];
      icon = "Papirus"; # TODO: Set icon properly.
    };
  };
}
