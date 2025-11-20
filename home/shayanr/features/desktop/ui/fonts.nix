{pkgs, ...}: {
  home.packages = with pkgs; [
    liberation_ttf
    freefont_ttf

    dejavu_fonts
    ubuntu-classic

    roboto
    roboto-mono
    libertine
    inconsolata

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
}
