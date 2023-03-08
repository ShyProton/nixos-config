{ pkgs, ... }:
{
  imports = [
    ./hyprland # WM+Compositor
    ./waybar # Desktop bar.
    ./wofi.nix # App launcher.
    ./gtk.nix # GTK configurations.
    ./cursor.nix # Cursor theme.
  ];

  # Extra UI packages.
  home.packages = with pkgs; [
    roboto-mono
  ];
}
