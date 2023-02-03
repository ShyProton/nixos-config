{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = lualine-nvim;
      type = "lua";
      config = "require('lualine').setup{}";
    }
    {
      plugin = bufferline-nvim;
      type = "lua";
      config = "require('bufferline').setup{}";
    }
  ];
}
