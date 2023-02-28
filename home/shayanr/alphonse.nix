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

    git = {
      enable = true;
      lfs.enable = true;

      userName = "SaiProton";
      userEmail = "shayanr1001@gmail.com";

      diff-so-fancy = {
        enable = true;
        stripLeadingSymbols = false;
      };
    };

    gh = {
      enable = true;
      # TODO: Test if this is needed.
      enableGitCredentialHelper = true;

      extensions = with pkgs; [ gh-markdown-preview ];

      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    bash = {
      enable = true;
      enableCompletion = true;
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
