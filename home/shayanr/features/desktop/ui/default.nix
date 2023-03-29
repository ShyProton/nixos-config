{ pkgs, ... }:
{
  imports = [
    ./wayland # Wayland WM.
    ./gtk.nix # GTK configurations.
    ./cursor.nix # Cursor theme.
  ];

  # Extra UI packages.
  home.packages = with pkgs; [
    roboto
    roboto-mono
  ];
}
