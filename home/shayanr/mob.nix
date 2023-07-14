{ inputs, outputs, config, ... }:
{
  imports = [
    # Impermanence for home-manager.
    inputs.impermanence.nixosModules.home-manager.impermanence
    # Declarative system colorscheme.
    inputs.nix-colors.homeManagerModule

    ./features/system # Userspace system configurations.
    ./features/cli # Command-line apps/utils.
    ./features/desktop # Desktop apps/utils.
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  # TODO: To be decided.
  wallpapers = {
    desktop = "${config.home.homeDirectory}/Pictures/wallpapers/1920x1200/...";
    lockscreen = "${config.home.homeDirectory}/Pictures/wallpapers/1920x1200/...";
  };

  colorscheme = inputs.nix-colors.colorschemes.gruvbox-dark-medium;

  home = {
    username = "shayanr";
    homeDirectory = "/home/${config.home.username}";
    # WARNING:: Update this to the iso version on install.
    stateVersion = "22.11";

    persistence."/persist${config.home.homeDirectory}" = {
      allowOther = true;
      directories = [
        ".dotfiles"
        ".ssh"
        ".cache"
        ".cargo" # TODO: Probably a better place to put this.
      ];
    };
  };

  programs = {
    home-manager.enable = true;

    ssh = {
      enable = true;
      extraConfig = ''
        Host github.com
          Hostname ssh.github.com
          Port 443
          User git
      '';
    };
  };
}
