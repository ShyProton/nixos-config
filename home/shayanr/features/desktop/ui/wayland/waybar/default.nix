{
  pkgs,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
    settings = {
      primary = {
        layer = "top";
        output = "${(builtins.head config.monitors).name}";
        position = "left";

        height =
          (builtins.head config.monitors).height
          - config.window-decorations.gap-size * 2;

        width = 40;

        modules-left = [
          "custom/nixos"
          "custom/notification"
          "wlr/workspaces"
        ];

        modules-right = [
          # "mpris"
          "pulseaudio#icon"
          "pulseaudio#volume"
          # "cpu#icon"
          # "cpu#usage"
          # "custom/seperator#sep1"
          # "memory#icon"
          # "memory#usage"
          # "custom/seperator#sep2"
          # "temperature#icon"
          # "temperature#temp"
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

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "󱅫";
            none = "󰂚";
            dnd-notification = "󰂛";
            dnd-none = "󰂛";
            inhibited-notification = "󱅫";
            inhibited-none = "󰂚";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰂛";
          };

          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        # TODO: Fix mpris status icon misalignment.
        "mpris" = {
          format = "{player_icon}\n{status_icon}";
          player-icons = {
            default = "";
            spotify = "";
            firefox = "󰈹";
          };
          status-icons = {
            paused = "󰐊";
            playing = "󰏤";
            stopped = "";
          };
        };

        # NOTE: Using pulseaudio module since wireplumber has errors.
        # WARN: Sets scroll-step to 0 since scrolling causes crashes.
        "pulseaudio#icon" = {
          format = "{icon}";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["󰕿" "󰖀" "󰕾"];
          };
          format-muted = "󰖁";
          format-bluetooth = "󰂰";
          on-click = "pavucontrol";
          scroll-step = 0;
        };

        "pulseaudio#volume" = {
          format = "{volume}%";
          max-length = 4;
          onclick = "pavucontrol";
          scroll-step = 0;
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
          format = "{used:0.1f}\nGiB";
        };

        "temperature#icon" = {
          format = "{icon}";
          format-icons = ["" "" "" "" ""];
        };

        "temperature#temp" = {
          format = "{temperatureC}C";
          max-length = 4;
        };

        "network#icon" = {
          format = "{icon}";
          format-icons = ["󰤟" "󰤢" "󰤥" "󰤨"];
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
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂"];
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
          spacing = 5;
        };

        "custom/power" = {
          format = "";
          tooltip = false;
          on-click = "powermenu";
        };
      };
    };

    style = import ./style.nix {inherit config;};
  };
}
