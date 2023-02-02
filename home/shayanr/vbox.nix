{ config, pkgs, ... }:
{
  imports = [
    # TODO: Extract nvim to be implemented in all machines
    ./features/nvim
  ];

  home = {
    username = "shayanr";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "22.11";

    # TODO: Replace with dedicated feature modules for each package w/configs.
    packages = with pkgs; [
      btop
      ranger
      firefox
      git-crypt
      gnupg
    ];

    persistence."/persist${config.home.homeDirectory}" = {
      directories = [
        ".dotfiles"
        ".mozilla/firefox"
      ];
      allowOther = true;
    };
  };

  programs = {
    home-manager.enable = true;

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
