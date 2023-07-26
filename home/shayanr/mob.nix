{
  inputs,
  outputs,
  config,
  ...
}: {
  imports =
    [
      # Impermanence for home-manager.
      inputs.impermanence.nixosModules.home-manager.impermanence
      # Declarative system colorscheme.
      inputs.nix-colors.homeManagerModule

      ./global # Implemented by all machines.

      ./features/system # Userspace system configurations.
      ./features/cli # Command-line apps/utils.
      ./features/desktop # Desktop apps/utils.
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  home.stateVersion = "23.05";

  wallpapers = {
    desktop = "${config.home.homeDirectory}/Pictures/wallpapers/1920x1200/gruvbox/solar_system_poster.jpeg";
    lockscreen = "${config.home.homeDirectory}/Pictures/wallpapers/1920x1200/gruvbox/sun_circle.jpg";
  };

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1200;
      refreshRate = 60;
    }
  ];

  window-decorations = {
    gap-size = 10;
    border-radius = 5;
  };

  colorscheme = inputs.nix-colors.colorschemes.gruvbox-dark-medium;
}
