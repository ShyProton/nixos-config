{ pkgs, ... }:
{
  imports = [
    ./xdg.nix # XDG configurations.
  ];

  home.packages = with pkgs; [
    pulseaudio
  ];
}
