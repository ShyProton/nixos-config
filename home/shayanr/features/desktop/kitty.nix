{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Cascadia Code";
      package = (pkgs.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; });
      size = 12;
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
