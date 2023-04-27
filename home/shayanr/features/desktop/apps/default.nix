{ pkgs, ... }:
{
  imports = [
    ./firefox # Web browser.
    # ./discord # Discord app.

    ./kitty.nix # Terminal emulator.
    ./webcord.nix # Discord client.
    ./spotify.nix # Music player.
    # ./idea.nix # IntelliJ IDEA.
  ];

  home.packages = with pkgs; [
    pavucontrol
  ];
}
