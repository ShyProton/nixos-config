{ config, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      jetbrains.idea-ultimate
      jdk
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/JetBrains"
      ".local/share/JetBrains"
      ".java"
      ".m2"
      ".gfclient" # Glassfish.
    ];
  };
}
