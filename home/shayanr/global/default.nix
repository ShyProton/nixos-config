{ config, ... }:
{
  home = {
    username = "shayanr";
    homeDirectory = "/home/${config.home.username}";
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

  programs.home-manager.enable = true;
}
