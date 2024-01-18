{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      (rstudioWrapper.override {
        packages = with rPackages; [ggplot2];
      })
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/RStudio"
      ".config/rstudio"
      ".local/share/rstudio"
    ];
  };
}
