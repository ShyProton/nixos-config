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
    ./spotify.nix # Music player.
    ./obsidian.nix # Note taking.
  ];

  home.packages = with pkgs; [
    pavucontrol
    chromium
    nautilus
    inputs.zen-browser.packages."${pkgs.system}".default
  ];
}
