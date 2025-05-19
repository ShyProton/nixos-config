{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      youtube-music
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/YouTube Music"
    ];
  };
}
