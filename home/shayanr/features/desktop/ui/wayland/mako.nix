{config, ...}: let
  inherit (config.colorScheme) palette;
  inherit (config.window-decorations) border-radius;
in {
  services.mako = {
    enable = true;
    font = "Roboto 12";
    padding = "10,20";

    iconPath = "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark";

    width = 400;
    height = 150;
    borderSize = 2;
    borderRadius = border-radius;
    anchor = "top-center";

    defaultTimeout = 12000;

    backgroundColor = "#${palette.base01}dd";
    borderColor = "#${palette.base04}dd";
    textColor = "#${palette.base05}dd";
  };
}
