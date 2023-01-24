{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "shayanr";
  home.homeDirectory = "/home/shayanr";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  manual.manpages.enable = false;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  # wayland.windowManager.hyprland.enable = true;
  # home.persistence."/persist/home/shayanr" = {
  #   directories = [
  #     ".dotfiles"
  #   ];
  # };

  home.packages = with pkgs; [
    btop
    ranger
    firefox
    git
    git-crypt
    gnupg
    neovim
  ];
}
