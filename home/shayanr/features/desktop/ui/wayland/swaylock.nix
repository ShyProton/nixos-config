{config, ...}: let
  inherit (config.colorScheme) palette;
in {
  programs.swaylock = {
    enable = true;
    settings = {
      font = "Roboto Mono";
      font-size = 50;

      line-uses-inside = true;
      disable-caps-lock-text = true;
      indicator-caps-lock = true;
      indicator-idle-visible = true;
      daemonize = true;

      indicator-radius = 200;
      indicator-thickness = 20;

      image = (monitor:
        with monitor; "${config.home.homeDirectory}/Pictures/wallpapers/${toString width}x${toString height}/${wallpapers.lockscreen}")
      (builtins.head config.monitors);

      color = "#${palette.base00}";
      ring-color = "#${palette.base02}";
      inside-wrong-color = "#${palette.base08}";
      ring-wrong-color = "#${palette.base08}";
      key-hl-color = "#${palette.base0B}";
      bs-hl-color = "#${palette.base08}";
      ring-ver-color = "#${palette.base09}";
      inside-ver-color = "#${palette.base09}";
      inside-color = "#${palette.base01}";
      text-color = "#${palette.base07}";
      text-clear-color = "#${palette.base01}";
      text-ver-color = "#${palette.base01}";
      text-wrong-color = "#${palette.base01}";
      text-caps-lock-color = "#${palette.base07}";
      inside-clear-color = "#${palette.base0C}";
      ring-clear-color = "#${palette.base0C}";
      inside-caps-lock-color = "#${palette.base09}";
      ring-caps-lock-color = "#${palette.base02}";
      separator-color = "#${palette.base02}";
    };
  };
}
