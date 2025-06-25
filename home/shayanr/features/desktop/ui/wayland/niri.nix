{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = let
    inherit (config.colorScheme) palette;
    inherit (config.window-decorations) gap-size;
  in {
    enable = true;

    settings = {
      prefer-no-csd = true;

      layout = {
        always-center-single-column = true;
        center-focused-column = "never";

        tab-indicator.hide-when-single-tab = true;

        gaps = gap-size;

        default-column-width.proportion = 0.5;
        preset-column-widths = [
          {proportion = 1.0 / 3.0;} # 33%
          {proportion = 1.0 / 2.0;} # 50%
          {proportion = 2.0 / 3.0;} # 66%
        ];

        focus-ring.enable = false;
        border = {
          enable = true;
          active.color = "#${palette.base05}";
          inactive.color = "#${palette.base03}";
        };

        shadow = {
          enable = true;
          softness = 8;
          spread = 8;
          draw-behind-window = true;
        };
      };

      spawn-at-startup = [
        {command = ["${pkgs.xwayland-satellite}/bin/xwayland-satellite"];}
        {command = ["swww-daemon"];}
        {command = ["swww-restore"];}
        {command = ["waybar"];}
      ];

      environment.DISPLAY = ":0";

      window-rules = [
        {
          matches = [{app-id = "zen-beta";}];
          clip-to-geometry = true;
        }
      ];

      binds = with config.lib.niri.actions; {
        "Mod+Return".action = spawn "kitty";

        "Mod+C".action = close-window;

        "Mod+G".action = toggle-column-tabbed-display;

        # Function keys
        "XF86MonBrightnessUp".action = spawn "light" "-A" "10";
        "XF86MonBrightnessDown".action = spawn "light" "-U" "10";

        "XF86AudioRaiseVolume".action = spawn "pactl" "set-sink-volume" "@DEFAULT_SINK@" "+5%";
        "XF86AudioLowerVolume".action = spawn "pactl" "set-sink-volume" "@DEFAULT_SINK@" "-5%";
        "XF86AudioMute".action = spawn "pactl" "set-sink-mute" "@DEFAULT_SINK@" "toggle";
        "XF86AudioMicMute".action = spawn "pactl" "set-source-mute" "@DEFAULT_SOURCE@" "toggle";

        # Launcher
        "Mod+A".action = spawn "wofi" "-S" "drun";

        # Power menu
        "Mod+Q".action = spawn "powermenu";

        # Window navigation
        "Mod+N".action = focus-window-down;
        "Mod+E".action = focus-window-up;
        "Mod+I".action = focus-column-right;
        "Mod+M".action = focus-column-left;

        "Mod+Down".action = focus-workspace-down;
        "Mod+Up".action = focus-workspace-up;
        "Mod+Right".action = focus-monitor-right;
        "Mod+Left".action = focus-monitor-left;

        "Mod+Shift+N".action = move-window-down;
        "Mod+Shift+E".action = move-window-up;
        "Mod+Shift+I".action = move-column-right;
        "Mod+Shift+M".action = move-column-left;

        "Mod+Shift+Down".action = move-column-to-workspace-down;
        "Mod+Shift+Up".action = move-column-to-workspace-up;
        "Mod+Shift+Right".action = move-column-to-monitor-right;
        "Mod+Shift+Left".action = move-column-to-monitor-left;

        "Mod+Ctrl+N".action = set-window-height "-10%";
        "Mod+Ctrl+E".action = set-window-height "+10%";
        "Mod+Ctrl+I".action = set-column-width "+10%";
        "Mod+Ctrl+M".action = set-column-width "-10%";

        "Mod+BracketLeft".action = consume-or-expel-window-left;
        "Mod+BracketRight".action = consume-or-expel-window-right;

        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+Space".action = toggle-window-floating;

        "Mod+R".action = switch-preset-column-width;

        "Alt+N".action = spawn "${pkgs.wtype}/bin/wtype" "-P" "down" "-p" "down";
        "Alt+E".action = spawn "${pkgs.wtype}/bin/wtype" "-P" "up" "-p" "up";
        "Alt+I".action = spawn "${pkgs.wtype}/bin/wtype" "-P" "right" "-p" "right";
        "Alt+M".action = spawn "${pkgs.wtype}/bin/wtype" "-P" "left" "-p" "left";
      };

      input = {
        focus-follows-mouse.enable = true;
        keyboard.xkb = {
          layout = "us";
          variant = "colemak_dh";
        };
      };

      outputs = builtins.listToAttrs (
        map (monitor:
          with monitor; {
            name = name;
            value = {
              mode = {
                width = width;
                height = height;
                refresh = refreshRate;
              };
              position = {
                x = x;
                y = y;
              };
            };
          })
        config.monitors
      );
    };
  };
}
