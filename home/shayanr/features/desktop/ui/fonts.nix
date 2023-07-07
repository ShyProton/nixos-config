{ pkgs, ... }:
{
  home.packages = with pkgs; [
    liberation_ttf
    freefont_ttf

    dejavu_fonts
    ubuntu_font_family

    roboto
    roboto-mono
    libertine
    inconsolata

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}
