{ inputs, outputs, config, ... }:
{
  imports = [
    # Impermanence for home-manager.
    inputs.impermanence.nixosModules.home-manager.impermanence
    # Declarative system colorscheme.
    inputs.nix-colors.homeManagerModule

    ./global # Implemented by all machines.

    ./features/system # Userspace system configurations.
    ./features/cli # Command-line apps/utils.
    ./features/desktop # Desktop apps/utils.
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  home.stateVersion = "23.05";

  # TODO: To be decided.
  wallpapers = {
    desktop = "${config.home.homeDirectory}/Pictures/wallpapers/1920x1200/...";
    lockscreen = "${config.home.homeDirectory}/Pictures/wallpapers/1920x1200/...";
  };

  colorscheme = inputs.nix-colors.colorschemes.gruvbox-dark-medium;
}
