{config, ...}: {
  home = {
    username = "shayanr";
    homeDirectory = "/home/${config.home.username}";

    persistence."/persist${config.home.homeDirectory}" = {
      allowOther = true;
      directories = [
        ".dotfiles"
        ".ssh"
        ".cache"
        ".cargo" # TODO: Probably a better place to put this.
        ".npm"
      ];
    };
  };

  programs.home-manager.enable = true;
}
