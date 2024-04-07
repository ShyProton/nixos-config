{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      (rstudioWrapper.override {
        packages = with rPackages; [
          ggplot2
          tidyverse
          dplyr
          RColorBrewer
          ggthemes
          ggpubr
          png
          gridExtra
          ozmaps
          sf
        ];
      })
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/RStudio"
      ".config/rstudio"
      ".local/share/rstudio"
    ];
  };
}
