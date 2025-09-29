{config, ...}: {
  imports = [
    ./age.nix
  ];

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
      ];
    };
  };

  # TODO: Probably have some sort of 'global settings' area
  # for stuff like this.
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.home-manager.enable = true;
}
