{
  imports = [
    ./hyprland # WM+Compositor
    ./swayidle.nix # Idling behaviour.
    ./swaylock.nix # Locking behaviour.
    ./waybar # Desktop bar.
    ./wofi.nix # App launcher.
    ./mako.nix # Notification daemon
    ./hyprpaper.nix # Wallpapers.
  ];
}
