{
  pkgs,
  inputs,
  ...
}: {
  # TODO: Make shorthand function to quickly add apps that only need the package
  # added and a config directory persisted.
  imports = [
    ./firefox # Web browser.
    ./zen.nix # Web browser.

    ./kitty.nix # Terminal emulator.
    ./spotify.nix # Music player.
    ./obsidian.nix # Note taking.
    ./reaper.nix # Audio editing.
  ];

  home.packages = with pkgs; [
    pavucontrol
    inkscape
    chromium
    nautilus
    inputs.zen-browser.packages."${pkgs.system}".default
  ];
}
