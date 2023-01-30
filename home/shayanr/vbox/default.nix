{ config, pkgs, inputs, ... }:
{
  imports = [
    # inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home = {
    stateVersion = "22.11";


    packages = with pkgs; [
      btop
      ranger
      firefox
      git-crypt
      gnupg
      neovim
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
