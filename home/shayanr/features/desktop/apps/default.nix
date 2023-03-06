{ pkgs, ... }:
{
  imports = [
    ./kitty.nix # Terminal emulator.
    ./firefox.nix # Web browser.
  ];

  home.packages = with pkgs; [
    audacity
    gimp
    spotify
    (discord.override { withOpenASAR = true; })
  ];
}
