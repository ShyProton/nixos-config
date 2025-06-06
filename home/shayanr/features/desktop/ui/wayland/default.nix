{
  imports = [
    ./hyprland # WM+Compositor
    ./hypridle.nix # Idling behaviour.
    ./hyprlock.nix # Locking behaviour.
    ./wofi.nix # App launcher.
    ./hyprpaper.nix # Wallpapers.
    ./waybar # Desktop bar.
    ./ags
    ./swaync # Notification center.
  ];
}
