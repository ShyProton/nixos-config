{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-tree-lua;
      type = "lua";
      config = "require('nvim-tree').setup({})";
    }
    {
      plugin = nvim-web-devicons;
      type = "lua";
      config = "require('nvim-web-devicons').setup{}";
    }
    {
      plugin = lualine-nvim;
      type = "lua";
      config = "require('lualine').setup{}";
    }
    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = "require('indent_blankline').setup{}";
    }
    {
      plugin = nvim-colorizer-lua;
      type = "lua";
      config = "require('colorizer').setup{}";
    }
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        require('gitsigns').setup {
          signs = {
            add = {
              hl = "GitSignsAdd",
              text = "▎",
              numhl = "GitSignsAddNr",
              linehl = "GitSignsAddLn"
            },
            change = {
              hl = "GitSignsChange",
              text = "▎",
              numhl = "GitSignsChangeNr",
              linehl = "GitSignsChangeLn"
            },
            delete = {
              hl = "GitSignsDelete",
              text = "契",
              numhl = "GitSignsDeleteNr",
              linehl = "GitSignsDeleteLn" 
            },
            topdelete = {
              hl = "GitSignsDelete",
              text = "契",
              numhl = "GitSignsDeleteNr",
              linehl = "GitSignsDeleteLn" 
            },
            changedelete = {
              hl = "GitSignsChange",
              text = "▎",
              numhl = "GitSignsChangeNr",
              linehl = "GitSignsChangeLn" 
            },
          }
        }
      '';
    }
  ];
}
