{config, ...}: let
  inherit (config) monitors;
  inherit (config.colorScheme) palette;
  inherit (config.window-decorations) border-radius;
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 1;
        hide_cursor = true;
        ignore_empty_input = true;
      };

      label = [
        # Time (Hour)
        {
          monitor = "";
          text = "cmd[update:1000] echo -e \"$(date +\"%I\")\"";
          color = "rgb(${palette.base06})";
          shadow_pass = 2;
          font_size = 150;
          font_family = "Roboto Mono";
          position = "0, -${toString ((builtins.head monitors).height / 3 - 170 / 2)}"; # 170 diff
          halign = "center";
          valign = "top";
        }
        # Time (Minute)
        {
          monitor = "";
          text = "cmd[update:1000] echo -e \"$(date +\"%M\")\"";
          color = "rgb(${palette.base06})";
          font_size = 150;
          font_family = "Roboto Mono";
          position = "0, -${toString ((builtins.head monitors).height / 3 + 170 / 2)}";
          halign = "center";
          valign = "top";
        }
        # Date
        {
          monitor = "";
          text = "cmd[update:1000] echo -e \"$(date +\"%A, %d %b\")\"";
          color = "rgb(${palette.base05})";
          font_size = 14;
          font_family = "Roboto Mono";
          position = "0, -${toString ((builtins.head monitors).height / 3 + 170 * 1.8)}";
          halign = "center";
          valign = "top";
        }
      ];

      background = {
        monitor = "";
        path = "screenshot";
        blur_passes = 2;
        contrast = 0.8916;
        brightness = 0.7172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0;
      };

      input-field = {
        monitor = "";
        size = "${toString ((builtins.head monitors).width / 4)}, 60";
        rounding = border-radius;
        fade_on_empty = false;
        outline_thickness = 3;
        dots_size = 0.1;
        dots_spacing = 1;
        inner_color = "rgb(${palette.base00})";
        outer_color = "rgb(${palette.base04})";
        font_color = "rgb(${palette.base06})";
        font_family = "Roboto Mono";
        position = "0, -${toString ((builtins.head monitors).height / 3 + 170 * 2.5)}";
        halign = "center";
        valign = "top";
        zindex = 10;
        placeholder_text = "<i>Input Password...</i>";
        fail_text = "<i><b>$FAIL</b></i>";
      };
    };
  };
}
