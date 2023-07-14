{ config, pkgs, ... }:
{
  imports = [
    # TODO: Extract nvim to be implemented in all machines
    ./features/cli
  ];

  home = {
    username = "shayanr";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "22.11";

    # TODO: Replace with dedicated feature modules for each package w/configs.
    packages = with pkgs; [
      firefox
    ];

    persistence."/persist${config.home.homeDirectory}" = {
      # TODO: Move persistent item declarations to their respective
      # configuration directories.
      directories = [
        ".dotfiles"
        ".ssh"
        ".cache"
        ".mozilla/firefox"
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

      userName = "ShyProton";
      userEmail = "shayanr@gmail.com";

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
  };
}
