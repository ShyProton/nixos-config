{
  imports = [
    ./hyprland # WM+Compositor
    ./niri.nix
    ./hypridle.nix # Idling behaviour.
    ./hyprlock.nix # Locking behaviour.
    ./wofi.nix # App launcher.
    ./hyprpaper.nix # Wallpapers.
    ./widgets
    ./waybar # Desktop bar.
    ./swaync # Notification center.
  ];
}
