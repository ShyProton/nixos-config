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

        ".gitlibs"

        # NOTE: Language-specific directories.
        ".cargo"
        ".npm"
        ".clojure"
        ".m2"
      ];
    };
  };

  programs.home-manager.enable = true;
}
