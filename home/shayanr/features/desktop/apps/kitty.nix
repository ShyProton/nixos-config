{
  pkgs,
  config,
  ...
}: let
  inherit (config.colorScheme) palette;
in {
  home = {
    packages = with pkgs; [
      nerd-fonts.symbols-only
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
      foreground = "#${palette.base07}";
      background = "#${palette.base00}";

      selection_foreground = "#${palette.base07}";
      selection_background = "#${palette.base04}";

      active_border_color = "#${palette.base08}";
      inactive_border_color = "#${palette.base04}";

      active_tab_foreground = "#${palette.base07}";
      active_tab_background = "#${palette.base04}";

      inactive_tab_foreground = "#${palette.base06}";
      inactive_tab_background = "#${palette.base02}";

      cursor = "#${palette.base07}";
      cursor_text_color = "#${palette.base00}";

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
      cursor_trail = 1;

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

      map alt+\ toggle_layout stack
      map alt+] next_window
      map alt+[ previous_window

      map ctrl+left resize_window narrower
      map ctrl+right resize_window wider
      map ctrl+up resize_window taller
      map ctrl+down resize_window shorter

      map kitty_mod+enter launch --cwd=current
      map kitty_mod+t     new_tab_with_cwd
    '';
  };
}
