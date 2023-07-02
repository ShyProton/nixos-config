{ pkgs, config, ... }:
{
  home = {
    packages = with pkgs; [
      obsidian
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/obsidian"
    ];
  };
}
