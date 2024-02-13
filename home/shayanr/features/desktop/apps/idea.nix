{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      jetbrains.idea-community
      # eclipses.eclipse-java
      jdk11
      h2
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
