{ inputs, config, pkgs, ... }:
{
  imports = [
    ./features/system # Userspace system configurations.
    ./features/cli # Command-line apps/utils.
    ./features/desktop # Desktop apps/utils.
  ];

  colorscheme = inputs.nix-colors.colorschemes.gruvbox-dark-medium;

  home = {
    username = "shayanr";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "22.11";

    persistence."/persist${config.home.homeDirectory}" = {
      # TODO: Move persistent item declarations to their respective
      # configuration directories.
      directories = [
        ".dotfiles"
        ".ssh"
        ".cache"
        ".config/gh"
      ];
      allowOther = true;
    };
  };

  # TODO: Divide into individual feature files.
  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

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
