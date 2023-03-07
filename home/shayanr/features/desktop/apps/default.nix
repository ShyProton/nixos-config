{ pkgs, ... }:
{
  imports = [
    ./kitty.nix # Terminal emulator.
    ./firefox.nix # Web browser.
    ./spotify.nix # Music player.
  ];

  home.packages = with pkgs; [
    audacity
    gimp
  ];
}
