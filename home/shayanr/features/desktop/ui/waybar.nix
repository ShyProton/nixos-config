{ pkgs, config, ... }:
let
  colors = config.colorScheme.colors;
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
    settings = {
      primary = {
        mode = "dock";
        layer = "top";
        position = "left";

        # TODO: Replace with display size - gap size * 2
        height = 1060;
        width = 40;

        modules-left = [
          "custom/nixos"
          "wlr/workspaces"
        ];

        modules-right = [
          "battery#icon"
          "battery#percentage"
          "clock"
        ];

        "custom/nixos" = {
          format = "";
          on-click = "wofi -S drun";
        };

        "wlr/workspaces" = {
          format = "{icon}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          on-click = "activate";
          format-icons = {
            active = "";
            default = "";
            urgent = "";
          };
        };

        "battery#icon" = {
          format = "{icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" "" "" ];
          format-charging = "󰂄";
          format-full = "󱈑";
          states = {
            warning = 25;
            critical = 10;
          };
          tooltip = false;
        };

        "battery#percentage" = {
          format = "{capacity}";
          tooltip = false;
        };

        clock = {
          format = "{:%H\n%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
      };
    };

    style = ''
      window#waybar {
        background-color: #${colors.base02};
        opacity: 0.95;
        border-radius: 0 5px 5px 0;
        font-family: "Roboto Mono";
      }

      #custom-nixos {
        color: #${colors.base00};
        background-image: linear-gradient(
          -45deg,
          #${colors.base0C} 0%, #${colors.base0D} 100%
        );
        font-size: 1.5em;
        border-radius: 0 5px 5px 0;
        padding: 10px 0;
      }

      #workspaces {
        background-color: #${colors.base0E};
        font-size: 1em;
        border-radius: 5px;
        margin-top: 10px;
        border-radius: 0 5px 5px 0;
      }

      #workspaces button {
        color: #${colors.base00};
        padding: 0;
        margin: 0;
      }

      #workspaces button.focused {
        color: #${colors.base01};
      }

      #battery.icon {
        font-size: 1.8em;
        background-color: #${colors.base0B};
        padding: 5px 0 3px 0;
        border-radius: 0 5px 0 0;
      }

      #battery.percentage {
        font-weight: bold;
        background-color: #${colors.base0B};
        border-radius: 0 0 5px 0;
      }

      #battery.charging:not(.percentage) {
        /* HACK: Fixes oddity where charging icon is slightly smaller */
        font-size: 2.2em;
        padding: 3px 0 0 0;
      }
    '';
  };
}
