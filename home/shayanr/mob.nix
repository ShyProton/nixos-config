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
      name = "HDMI-A-1";
      width = 1920;
      height = 1080;
      x = 0;
      y = 0;
      refreshRate = 144;
      wallpapers = {
        desktop = "gruvbox/waves.png";
        lockscreen = "gruvbox/sun_circle.jpg";
      };
    }
    {
      name = "eDP-1";
      width = 1920;
      height = 1200;
      x = 1920;
      y = 0;
      refreshRate = 60;
      wallpapers = {
        desktop = "flexoki/atlaspbody.jpg";
        lockscreen = "gruvbox/sun_circle.jpg";
      };
    }
  ];

  window-decorations = {
    gap-size = 10;
    border-radius = 5;
  };

  colorscheme = {
    name = "flexoki_dark";
    palette = {
      base00 = "100F0F";
      base01 = "1C1B1A";
      base02 = "282726";
      base03 = "343331";
      base04 = "403E3C";
      base05 = "575653";
      base06 = "878580";
      base07 = "CECDC3";
      base08 = "D14D41";
      base09 = "DA702C";
      base0A = "D0A215";
      base0B = "879A39";
      base0C = "3AA99F";
      base0D = "4385BE";
      base0E = "8B7EC8";
      base0F = "CE5D97";
    };
  };
}
