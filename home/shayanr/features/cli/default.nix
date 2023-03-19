{ pkgs, ... }:
{
  # Command line programs.
  imports = [
    ./nvim # Text editor.
    ./zsh.nix # Shell.
    ./prompt.nix # Shell prompt.
    ./git.nix # Git version control.
    ./tldr.nix # Short help-pages.
  ];

  home.packages = with pkgs; [
    # Utilities.
    age

    # Interfaces.
    ranger
    btop
    pavucontrol

    # Replacements.
    bat
    exa
    ripgrep
  ];
}
