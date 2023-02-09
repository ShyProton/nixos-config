{ pkgs, ... }:
{
  # Command line programs.
  imports = [
    ./nvim
  ];

  home.packages = with pkgs; [
    age
    btop
    ranger
    ripgrep
    bat
    exa
    ncdu
    tealdeer
  ];
}
