{pkgs, ...}: {
  # TODO: Make shorthand function to quickly add apps that only need the package
  # added and a config directory persisted.
  imports = [
    ./firefox # Web browser.
    # ./discord # Discord app.

    ./kitty.nix # Terminal emulator.
    ./spotify.nix # Music player.
    ./webcord.nix # Discord client.
    ./obsidian.nix # Note taking.
    # ./idea.nix # IntelliJ IDEA.
  ];

  home.packages = with pkgs; [
    pavucontrol
  ];
}
