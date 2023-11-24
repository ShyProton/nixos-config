{
  inputs,
  outputs,
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

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1200;
      x = 0;
      y = 500;
      refreshRate = 60;
      wallpapers = {
        desktop = "gruvbox/solar_system_poster.jpeg";
        lockscreen = "gruvbox/sun_circle.jpg";
      };
    }
    {
      name = "HDMI-A-1";
      width = 1920;
      height = 1080;
      x = 1920;
      y = 0;
      refreshRate = 144;
      wallpapers = {
        desktop = "gruvbox/waves.png";
        lockscreen = "gruvbox/sun_circle.jpg";
      };
    }
  ];

  window-decorations = {
    gap-size = 10;
    border-radius = 5;
  };

  colorscheme = inputs.nix-colors.colorschemes.gruvbox-dark-medium;
}
