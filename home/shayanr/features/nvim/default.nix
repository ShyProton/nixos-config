{ config, pkgs, ... }:
{
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      # TODO: Put plugins here
    ];
  };
}
