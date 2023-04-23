{ pkgs, ... }:
{
  imports = [
    ./firefox # Web browser.
    # ./discord # Discord app.

    ./webcord.nix # Discord client.
    ./kitty.nix # Terminal emulator.
    ./spotify.nix # Music player.
    # ./idea.nix # IntelliJ IDEA.
  ];

  home.packages = with pkgs; [
    pavucontrol
  ];
}
