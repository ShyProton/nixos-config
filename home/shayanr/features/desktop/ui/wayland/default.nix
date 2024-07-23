{
  imports = [
    ./hyprland # WM+Compositor
    ./hypridle.nix # Idling behaviour.
    ./swaylock.nix # Locking behaviour.
    ./wofi.nix # App launcher.
    ./hyprpaper.nix # Wallpapers.
    ./waybar # Desktop bar.
    ./swaync # Notification center.
  ];
}
