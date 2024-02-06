{
  pkgs,
  config,
  ...
}: let
  inherit (config.colorScheme) palette;
in {
  home = {
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    ];

    sessionVariables.TERMINAL = "kitty";
  };

  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.cascadia-code;
      name = "Cascadia Code";
      size = 12;
    };

    settings = {
      foreground = "#${palette.base06}";
      background = "#${palette.base00}";

      selection_foreground = "#${palette.base00}";
      selection_background = "#${palette.base07}";

      active_border_color = "#${palette.base05}";
      inactive_border_color = "#${palette.base03}";

      active_tab_foreground = "#${palette.base07}";
      active_tab_background = "#${palette.base03}";

      inactive_tab_foreground = "#${palette.base04}";
      inactive_tab_background = "#${palette.base01}";

      cursor = "#${palette.base04}";
      cursor_text_color = "background";

      url_color = "#${palette.base0D}";

      color0 = "#${palette.base03}";
      color1 = "#${palette.base08}";
      color2 = "#${palette.base0B}";
      color3 = "#${palette.base0A}";
      color4 = "#${palette.base0D}";
      color5 = "#${palette.base0E}";
      color6 = "#${palette.base0C}";
      color7 = "#${palette.base04}";
      color8 = "#${palette.base03}";
      color9 = "#${palette.base08}";
      color10 = "#${palette.base0B}";
      color11 = "#${palette.base0A}";
      color12 = "#${palette.base0D}";
      color13 = "#${palette.base0E}";
      color14 = "#${palette.base0C}";
      color15 = "#${palette.base04}";

      cursor_shape = "beam";

      enable_audio_bell = "no";
    };

    extraConfig = ''
      symbol_map U+E000-U+E00D Symbols Nerd Font
      symbol_map U+e0a0-U+e0a2,U+e0b0-U+e0b3 Symbols Nerd Font
      symbol_map U+e0a3-U+e0a3,U+e0b4-U+e0c8,U+e0cc-U+e0d2,U+e0d4-U+e0d4 Symbols Nerd Font
      symbol_map U+e5fa-U+e62b Symbols Nerd Font
      symbol_map U+e700-U+e7c5 Symbols Nerd Font
      symbol_map U+f000-U+f2e0 Symbols Nerd Font
      symbol_map U+e200-U+e2a9 Symbols Nerd Font
      symbol_map U+f400-U+f4a8,U+2665-U+2665,U+26A1-U+26A1,U+f27c-U+f27c Symbols Nerd Font
      symbol_map U+F300-U+F313 Symbols Nerd Font
      symbol_map U+23fb-U+23fe,U+2b58-U+2b58 Symbols Nerd Font
      symbol_map U+f500-U+fd46 Symbols Nerd Font
      symbol_map U+e300-U+e3eb Symbols Nerd Font
      symbol_map U+21B5,U+25B8,U+2605,U+2630,U+2632,U+2714,U+E0A3,U+E615,U+E62B Symbols Nerd Font
    '';
  };
}
