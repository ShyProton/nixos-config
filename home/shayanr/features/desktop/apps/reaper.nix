{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      reaper
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/REAPER"
    ];
  };
}
