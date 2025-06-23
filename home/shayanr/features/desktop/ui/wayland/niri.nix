{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;

    settings = {
      binds = with config.lib.niri.actions; {
        "Mod+Return".action = spawn "kitty";

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

        "Alt+N".action = spawn "${pkgs.wtype}/bin/wtype" "-P" "down" "-p" "down";
        "Alt+E".action = spawn "${pkgs.wtype}/bin/wtype" "-P" "up" "-p" "up";
        "Alt+I".action = spawn "${pkgs.wtype}/bin/wtype" "-P" "right" "-p" "right";
        "Alt+M".action = spawn "${pkgs.wtype}/bin/wtype" "-P" "left" "-p" "left";
      };

      input.keyboard.xkb = {
        layout = "us";
        variant = "colemak_dh";
      };

      # TODO: uuuhhh uuummmmm uuuuuuuuuuhhhhhhhhhhhhh
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
