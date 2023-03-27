{ pkgs, ... }:
{
  programs.nixvim.plugins.presence-nvim = {
    enable = true;

    neovimImageText = "Neovim";
    mainImage = "file";

    # TODO: Fix their issue with nushell, then add button to current working repo.
    buttons = [
      {
        label = "GitHub Profile";
        url = "https://github.com/SaiProton";
      }
    ];
  };
}
