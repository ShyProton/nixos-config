{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      signal-desktop
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/Signal"
    ];
  };
}
