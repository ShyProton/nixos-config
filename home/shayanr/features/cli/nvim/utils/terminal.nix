{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      toggleterm-nvim
    ];

    extraConfigLua = ''
      toggleterm = require('toggleterm')

      toggleterm.setup({
        size = 20,
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = -18,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    '';

    maps = {
      normal = {
        "<M-Enter>".action = "<cmd>ToggleTermToggleAll<cr>";
        "<M-\\>".action = "<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>";
        "<M-]>".action = "<cmd>exe v:count1 . \"ToggleTerm direction=vertical size=70\"<cr>";
        "<M-[>".action = "<cmd>exe v:count1 . \"ToggleTerm direction=horizontal size=15\"<cr>";
      };

      terminal = {
        "<C-k>".action = "<C-\\><C-n><C-w>k";
        "<C-j>".action = "<C-\\><C-n><C-w>j";
        "<C-h>".action = "<C-\\><C-n><C-w>h";

        "<M-Enter>".action = "<cmd>ToggleTermToggleAll<cr>";
        "<M-\\>".action = "<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>";
        "<M-]>".action = "<cmd>exe v:count1 . \"ToggleTerm direction=vertical size=70\"<cr>";
        "<M-[>".action = "<cmd>exe v:count1 . \"ToggleTerm direction=horizontal size=15\"<cr>";
      };
    };
  };
}
