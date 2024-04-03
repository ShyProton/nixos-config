{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      prismlauncher
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".local/share/PrismLauncher"
    ];
  };
}
