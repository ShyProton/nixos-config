{
  imports = [
    # Editor configurations.
    ./editor

    # Language support.
    # ./langs

    # User Interface plugins.
    ./ui

    # Color theme.
    ./theme.nix
  ];

  programs.nixvim.enable = true;
}
