{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ catppuccin-nvim ];
    colorscheme = "catppuccin";
  };
}
