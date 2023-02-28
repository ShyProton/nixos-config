{ pkgs, config, ... }:
let
  wallpaper = "Pictures/wallpapers/girl-reading-book.png";
in
{
  # WM Packages.
  home = {
    packages = with pkgs; [
      wlr-randr
      swaybg
    ];

    sessionVariables = {
      HYPRLAND_LOG_WLR = 1;

      # TODO: Only enable these if the host system has an nvidia card.
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = 1;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    nvidiaPatches = true;
    extraConfig = ''
      general {
        gaps_in = 5
        gaps_out = 10
        border_size = 1
        cursor_inactive_timeout = 4

        col.active_border=0xff${config.colorScheme.colors.base05}
        col.inactive_border=0xff${config.colorScheme.colors.base03}
      }

      decoration {
        active_opacity = 1.0
        inactive_opacity = 0.85
        fullscreen_opacity = 1.0
        rounding = 5
        blur = true
        blur_size = 5
        blur_passes = 3
        blur_new_optimizations = true
        blur_ignore_opacity = true
        drop_shadow = true
        shadow_range = 12
        shadow_offset = 4 4
        col.shadow = 0x99000000
        col.shadow_inactive = 0x44000000
      }

      animations {
        enabled = true

        bezier = overshot,0.13,0.99,0.29,1.1
        bezier = easein,0.11,0,0.5,0
        bezier = easeout,0.5,1,0.89,1

        animation = windows,1,4,overshot,slide
        animation = windowsMove,1,4,overshot

        animation = workspaces,1,2,easeout,slidevert

        animation = border,1,3,easeout

        animation = fadeIn,1,3,easeout
        animation = fadeOut,1,3,easein
        animation = fadeSwitch,1,3,easeout
        animation = fadeShadow,1,3,easeout
        animation = fadeDim,1,3,easeout
      }

      gestures {
        workspace_swipe = yes
        workspace_swipe_fingers = 3
      }

      # Monitor configurations
      monitor = eDP-1,1920x1080@120,0x0,1

      # Startup
      exec-once = waybar
      exec-once = hyprctl setcursor ${config.home.pointerCursor.name} ${builtins.toString config.home.pointerCursor.size}

      exec = swaybg -i ${wallpaper} --mode fill

      # Program bindings
      bind = SUPER,Return,exec,kitty
      bind = SUPER,f,exec,firefox

      # WM controls
      bind = SUPERSHIFT,c,killactive
      bind = SUPERSHIFT,q,exit

      bindm = SUPER,mouse:272,movewindow
      bindm = SUPER,mouse:273,resizewindow

      bind = SUPERSHIFT,h,movewindow,l
      bind = SUPERSHIFT,l,movewindow,r
      bind = SUPERSHIFT,k,movewindow,u
      bind = SUPERSHIFT,j,movewindow,d

      bind = SUPER,h,resizeactive,-20 0
      bind = SUPER,l,resizeactive,20 0
      bind = SUPER,k,resizeactive,0 -20 
      bind = SUPER,j,resizeactive,0 20
    '';
  };
}
