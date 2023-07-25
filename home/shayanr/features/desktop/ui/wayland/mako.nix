{config, ...}: let
  inherit (config.colorScheme) colors;
in {
  services.mako = {
    enable = true;
    font = "Roboto 12";
    padding = "10,20";

    iconPath = "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark";

    width = 400;
    height = 150;
    borderSize = 2;
    borderRadius = 5;
    anchor = "top-center";

    defaultTimeout = 12000;

    backgroundColor = "#${colors.base01}dd";
    borderColor = "#${colors.base04}dd";
    textColor = "#${colors.base05}dd";
  };
}
