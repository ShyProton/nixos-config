{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix # WM+Compositor
    ./waybar.nix # Desktop bar.
    ./wofi.nix # App launcher.
    ./cursor.nix # Cursor theme.
  ];

  # Extra UI packages.
  home.packages = with pkgs; [
    roboto-mono
  ];
}
