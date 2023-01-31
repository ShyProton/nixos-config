{ config, pkgs, inputs, ... }:
{
  # FIXME: Importing this causes infinite recursion.
  # imports = [
  #   inputs.impermanence.nixosModules.home-manager.impermanence
  # ];

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
      neovim
    ];

    # persistence."/persist${config.home.homeDirectory}" = {
    #   directories = [
    #     ".dotfiles"
    #     ".mozilla/firefox"
    #   ];
    #   allowOther = true;
    # };
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
