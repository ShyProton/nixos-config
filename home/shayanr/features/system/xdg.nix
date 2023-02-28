{ pkgs, config, ... }:
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home = {
    packages = with pkgs; [ xdg-utils ];
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
