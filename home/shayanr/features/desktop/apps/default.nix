{ pkgs, ... }:
{
  imports = [
    ./discord # Discord chat.

    ./kitty.nix # Terminal emulator.
    ./firefox.nix # Web browser.
    ./spotify.nix # Music player.
    ./idea.nix # IntelliJ IDEA.
  ];

  home.packages = with pkgs; [
    audacity
    gimp
  ];
}
