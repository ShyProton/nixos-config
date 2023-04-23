{ pkgs, config, ... }:
{
  home = {
    packages = with pkgs; [
      webcord
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/WebCord"
    ];
  };
}
