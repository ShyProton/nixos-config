# Hyprland configuration settings.
{
  inputs,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = let
    inherit (config.window-decorations) gap-size border-radius;
    inherit (config.colorScheme) colors;

    inherit (inputs.hyprwm-contrib.packages.${pkgs.system}) grimblast scratchpad;
  in {
    general = {
      gaps_in = gap-size / 2;
      gaps_out = gap-size;
      border_size = 2;

      "col.active_border" = "0xff${colors.base05}";
      "col.inactive_border" = "0xff${colors.base03}";
    };

    decoration = {
      active_opacity = 1.0;
      inactive_opacity = 0.85;
      fullscreen_opacity = 1.0;
      rounding = border-radius;

      blur = {
        enabled = true;
        size = 5;
        passes = 3;
        new_optimizations = true;
        ignore_opacity = false;
      };

      drop_shadow = true;
      dim_inactive = true;
      dim_strength = 0.2;
      shadow_range = 12;
      shadow_offset = "4 4";

      "col.shadow" = "0x99000000";
      "col.shadow_inactive" = "0x44000000";
    };

    animations = {
      enabled = true;

      bezier = [
        "overshot, 0.13, 0.99, 0.29, 1.1"
        "easein, 0.11, 0, 0.5, 0"
        "easeout, 0.5, 1, 0.89, 1"
      ];

      animation = [
        "windows, 1, 4, overshot, slide"
        "windowsMove, 1, 4, overshot"

        "workspaces, 1, 2, easeout, slidevert"

        "border, 1, 3, easeout"

        "fadeIn, 1, 3, easeout"
        "fadeOut, 1, 3, easein"
        "fadeSwitch, 1, 3, easeout"
        "fadeShadow, 1, 3, easeout"
        "fadeDim, 1, 3, easeout"
      ];
    };

    gestures = {
      workspace_swipe = "yes";
      workspace_swipe_fingers = 3;
    };

    misc = {
      force_default_wallpaper = 0;
      background_color = "0x${colors.base00}";
    };

    group = {
      "col.border_inactive" = "0x88${colors.base09}";
      "col.border_active" = "0xff${colors.base0A}";

      groupbar = {
        font_size = 10;
        "col.inactive" = "0x88${colors.base09}";
        "col.active" = "0xff${colors.base0A}";
      };
    };

    # Startup
    exec-once = [
      "waybar"
      "hyprpaper"
      "mako"
      "swayidle -w"
      "hyprctl setcursor ${config.home.pointerCursor.name} ${builtins.toString config.home.pointerCursor.size}"
    ];

    # Monitor configurations
    monitor = let
      monitorConf = monitor:
        with monitor; "${name}, ${toString width}x${toString height}@${toString refreshRate}, ${toString x}x${toString y}, 1";
    in
      map monitorConf config.monitors;

    bind =
      (let
        grimblast-path = "${grimblast}/bin/grimblast";
        output = "${config.home.homeDirectory}/Pictures/screenshots/$(date +%s).png";
      in [
        # Screenshots
        ", Print, exec, ${grimblast-path} --notify copysave output ${output}"
        "SHIFT, Print, exec, ${grimblast-path} --notify copysave active ${output}"
        "CONTROL, Print, exec, ${grimblast-path} --notify copysave screen ${output}"
        "ALT, Print, exec, ${grimblast-path} --notify copysave area ${output}"
      ])
      ++ (let
        scratchpad-path = "${scratchpad}/bin/scratchpad";
      in [
        # FIXME: Doesn't work due to pgrep -x not detecting Hyprland
        "SUPER, s, exec, ${scratchpad-path}"
        "SUPERSHIFT, s, exec, ${scratchpad-path} -l -g"
      ])
      ++ [
        # Program bindings
        "SUPER, Return, exec, kitty"

        # Function keys
        ", XF86MonBrightnessUp, exec, light -A 10"
        ", XF86MonBrightnessDown, exec, light -U 10"

        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ", XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
        ", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"

        # Launcher
        "SUPER, a, exec, wofi -S drun"

        # Power menu
        "SUPER, q, exec, powermenu"

        # WM controls
        "SUPERSHIFT, q, exit"

        "SUPER, c, killactive"
        "SUPER, f, fullscreen, 1"
        "SUPER, space, togglefloating"
        "SUPER, g, togglegroup"
        "SUPER, Tab, changegroupactive"

        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        "SUPERSHIFT, h, movewindow, l"
        "SUPERSHIFT, l, movewindow, r"
        "SUPERSHIFT, k, movewindow, u"
        "SUPERSHIFT, j, movewindow, d"

        "SUPERCONTROL, h, resizeactive, -20 0"
        "SUPERCONTROL, l, resizeactive, 20 0"
        "SUPERCONTROL, k, resizeactive, 0 -20"
        "SUPERCONTROL, j, resizeactive, 0 20"

        "SUPER, up, workspace, -1"
        "SUPER, down, workspace, +1"

        # Workspace controls
        "SUPER, 1, workspace, 01"
        "SUPER, 2, workspace, 02"
        "SUPER, 3, workspace, 03"
        "SUPER, 4, workspace, 04"
        "SUPER, 5, workspace, 05"
        "SUPER, 6, workspace, 06"
        "SUPER, 7, workspace, 07"
        "SUPER, 8, workspace, 08"
        "SUPER, 9, workspace, 09"
        "SUPER, 0, workspace, 10"
        "SUPER, f1, workspace, 11"
        "SUPER, f2, workspace, 12"
        "SUPER, f3, workspace, 13"
        "SUPER, f4, workspace, 14"
        "SUPER, f5, workspace, 15"
        "SUPER, f6, workspace, 16"
        "SUPER, f7, workspace, 17"
        "SUPER, f8, workspace, 18"
        "SUPER, f9, workspace, 19"
        "SUPER, f10, workspace, 20"
        "SUPER, f11, workspace, 21"
        "SUPER, f12, workspace, 22"

        "SUPERSHIFT, 1, movetoworkspacesilent, 01"
        "SUPERSHIFT, 2, movetoworkspacesilent, 02"
        "SUPERSHIFT, 3, movetoworkspacesilent, 03"
        "SUPERSHIFT, 4, movetoworkspacesilent, 04"
        "SUPERSHIFT, 5, movetoworkspacesilent, 05"
        "SUPERSHIFT, 6, movetoworkspacesilent, 06"
        "SUPERSHIFT, 7, movetoworkspacesilent, 07"
        "SUPERSHIFT, 8, movetoworkspacesilent, 08"
        "SUPERSHIFT, 9, movetoworkspacesilent, 09"
        "SUPERSHIFT, 0, movetoworkspacesilent, 10"
        "SUPERSHIFT, f1, movetoworkspacesilent, 11"
        "SUPERSHIFT, f2, movetoworkspacesilent, 12"
        "SUPERSHIFT, f3, movetoworkspacesilent, 13"
        "SUPERSHIFT, f4, movetoworkspacesilent, 14"
        "SUPERSHIFT, f5, movetoworkspacesilent, 15"
        "SUPERSHIFT, f6, movetoworkspacesilent, 16"
        "SUPERSHIFT, f7, movetoworkspacesilent, 17"
        "SUPERSHIFT, f8, movetoworkspacesilent, 18"
        "SUPERSHIFT, f9, movetoworkspacesilent, 19"
        "SUPERSHIFT, f10, movetoworkspacesilent, 20"
        "SUPERSHIFT, f11, movetoworkspacesilent, 21"
        "SUPERSHIFT, f12, movetoworkspacesilent, 22"
      ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    windowrulev2 = [
      "tile, class:^(Spotify)$"
      "float, class:^(pavucontrol)$"
      "float, class:^(.blueman-manager-wrapped)$"

      # Firefox Picture-in-Picture rules
      "float, class:^(firefox)$, title:^(Picture-in-Picture)$"
      "pin, class:^(firefox)$, title:^(Picture-in-Picture)$"
      "opaque, class:^(firefox)$, title:^(Picture-in-Picture)$"
      "noblur, class:^(firefox)$, title:^(Picture-in-Picture)$"
    ];

    layerrule = [
      "blur, waybar"
    ];
  };
}
