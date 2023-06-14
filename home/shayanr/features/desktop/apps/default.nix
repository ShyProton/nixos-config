{ pkgs, ... }:
{
  imports = [
    ./firefox # Web browser.
    # ./discord # Discord app.

    ./kitty.nix # Terminal emulator.
    ./spotify.nix # Music player.
    # FIXME: Webcord & Discord both fail to launch due to a problem with opengl.
    ./webcord.nix # Discord client.
    # ./idea.nix # IntelliJ IDEA.
  ];

  home.packages = with pkgs; [
    pavucontrol
  ];
}
