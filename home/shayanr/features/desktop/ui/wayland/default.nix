{
  imports = [
    ./hyprland # WM+Compositor
    ./hypridle.nix # Idling behaviour.
    ./swaylock.nix # Locking behaviour.
    ./waybar # Desktop bar.
    ./wofi.nix # App launcher.
    ./swaync.nix # Notification center.
    ./hyprpaper.nix # Wallpapers.
  ];
}
