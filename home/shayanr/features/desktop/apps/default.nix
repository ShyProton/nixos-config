{ pkgs, ... }:
{
  imports = [
    ./firefox # Web browser.
    ./discord # Discord app.

    ./kitty.nix # Terminal emulator.
    ./spotify.nix # Music player.
    # ./webcord.nix # Discord client.
    # ./idea.nix # IntelliJ IDEA.
  ];

  home.packages = with pkgs; [
    pavucontrol
  ];
}
