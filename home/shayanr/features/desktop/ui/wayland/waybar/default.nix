{ pkgs, config, ... }:
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
          "cpu#icon"
          "cpu#usage"
          "custom/seperator#sep1"
          "memory#icon"
          "memory#usage"
          "custom/seperator#sep2"
          "temperature#icon"
          "temperature#temp"
          "network#icon"
          "network#strength"
          "battery#icon"
          "battery#percentage"
          "clock#icon"
          "clock#time"
          "tray"
          "custom/power"
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

        "cpu#icon" = {
          format = "󰍛";
        };

        "cpu#usage" = {
          format = "{usage}%";
          max-length = 4;
        };

        "custom/seperator#sep1" = {
          format = "───";
        };

        "custom/seperator#sep2" = {
          format = "───";
        };

        "memory#icon" = {
          format = "";
        };

        "memory#usage" = {
          format = "{percentage}%";
          max-length = 4;
        };

        "temperature#icon" = {
          format = "{icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        "temperature#temp" = {
          format = "{temperatureC}C";
          max-length = 4;
        };

        "network#icon" = {
          format = "{icon}";
          format-icons = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
          format-ethernet = "󰈀";
          format-disconnected = "󰤭";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname} via ETH";
          tooltip-format-disconnected = "Disconnected";
        };

        "network#strength" = {
          format-wifi = "{signalStrength}%";
          format-ethernet = "ETH";
          format-disconnected = "NONE";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname} via ETH";
          tooltip-format-disconnected = "Disconnected";
          max-length = 4;
        };

        "battery#icon" = {
          format = "{icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" "" "" ];
          format-plugged = "󰂄";
          format-charging = "󰂄";
          format-full = "󱈑";
          states = {
            warning = 25;
            critical = 10;
          };
          tooltip = false;
        };

        "battery#percentage" = {
          format = "{capacity}%";
          tooltip = false; # TODO: Make tooltip estimated battery time.
          max-length = 4;
        };

        "clock#icon" = {
          format = "󰥔";
          tooltip = false;
        };

        "clock#time" = {
          format = "{:%I\n%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "tray" = {
          icon-size = 21;
          spacing = 10;
        };

        "custom/power" = {
          format = "⏻";
        };
      };
    };

    style = import ./style.nix { colors = config.colorScheme.colors; };
  };
}
