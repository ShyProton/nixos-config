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

  home.stateVersion = "22.11";

  wallpapers = {
    desktop = "${config.home.homeDirectory}/Pictures/wallpapers/1920x1080/glados.jpg";
    lockscreen = "${config.home.homeDirectory}/Pictures/wallpapers/1920x1080/rainbow.png";
  };

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1080;
      refreshRate = 120;
    }
  ];

  colorscheme = inputs.nix-colors.colorschemes.gruvbox-dark-medium;
}
