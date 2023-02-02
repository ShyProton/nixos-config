{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-tree-lua;
      type = "lua";
      config = "require('nvim-tree').setup({})";
    }
  ];
}
