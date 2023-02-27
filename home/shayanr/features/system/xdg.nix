{ config, ... }:
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home = {
    persistence."/persist${config.home.homeDirectory}".directories = [
      "Desktop"
      "Documents"
      "Downloads"
      "Music"
      "Pictures"
      "Public"
      "Templates"
      "Videos"
    ];
  };
}
