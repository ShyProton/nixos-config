{ config, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      primary = {
        mode = "dock";
        layer = "top";
        position = "left";

        width = 40;
      };
    };

    style = ''
      window#waybar {
        background-color: #${config.colorScheme.colors.base02};
        border-radius: 0;
      }
    '';
  };
}
