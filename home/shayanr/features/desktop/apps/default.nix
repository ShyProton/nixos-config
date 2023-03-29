{ pkgs, ... }:
{
  imports = [
    ./firefox # Web browser.
    ./discord # Discord chat.

    ./kitty.nix # Terminal emulator.
    ./spotify.nix # Music player.
    ./idea.nix # IntelliJ IDEA.
  ];

  home.packages = with pkgs; [
    audacity
    gimp
  ];
}
