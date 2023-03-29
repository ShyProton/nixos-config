{ pkgs, ... }:
{
  programs.nixvim.plugins.presence-nvim = {
    enable = true;
    # NOTE: Using temporary fork of presence until PR is merged.
    package = pkgs.vimUtils.buildVimPlugin {
      name = "presence.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "SaiProton";
        repo = "presence.nvim";
        rev = "25b0c1e816383358aa0ebe5101df0d244a055f81";
        sha256 = "sha256-Ct7MlC2DGJ8lvGYo9jR/1S74krEwQIkBUZrwdCs0iPk=";
      };
    };

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
