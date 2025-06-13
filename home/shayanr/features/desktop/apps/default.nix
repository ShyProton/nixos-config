{
  pkgs,
  inputs,
  ...
}: {
  # TODO: Make shorthand function to quickly add apps that only need the package
  # added and a config directory persisted.
  imports = [
    ./zen.nix # Web browser.
    ./kitty.nix # Terminal emulator.
    ./obsidian.nix # Note taking.
    ./godot.nix # Game development.
    ./discord.nix # Chatting.
    ./yt-music.nix # Music player.
  ];

  home.packages = with pkgs; [
    pavucontrol
    krita
    inputs.zen-browser.packages."${pkgs.system}".default
  ];
}
