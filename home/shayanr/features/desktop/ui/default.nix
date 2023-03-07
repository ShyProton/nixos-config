{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix # WM+Compositor
    ./waybar.nix # Desktop bar.
    ./wofi.nix # App launcher.
    ./gtk.nix # GTK configurations.
    ./cursor.nix # Cursor theme.
  ];

  # Extra UI packages.
  home.packages = with pkgs; [
    roboto-mono
  ];
}
