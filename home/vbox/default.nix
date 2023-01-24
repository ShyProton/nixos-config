{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.shayanr = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "shayanr";
    home.homeDirectory = "/home/shayanr";

    imports = [
      inputs.impermanence.nixosModules.home-manager.impermanence
    ];


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

    home.packages = with pkgs; [
      btop
      ranger
      firefox
      git
      git-crypt
      gnupg
      neovim
    ];

    # TODO: Figure out how to wipe home in the first place.
    home.persistence = { };
  };
}
