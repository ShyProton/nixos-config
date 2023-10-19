{pkgs, ...}: {
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

    keymaps = [
      {
        key = "<M-Enter>";
        action = "<cmd>ToggleTermToggleAll<cr>";
        mode = "n";
      }
      {
        key = "<M-\\>";
        action = "<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>";
        mode = "n";
      }
      {
        key = "<M-]>";
        action = "<cmd>exe v:count1 . \"ToggleTerm direction=vertical size=70\"<cr>";
        mode = "n";
      }
      {
        key = "<M-[>";
        action = "<cmd>exe v:count1 . \"ToggleTerm direction=horizontal size=15\"<cr>";
        mode = "n";
      }
      {
        key = "<M-Enter>";
        action = "<cmd>ToggleTermToggleAll<cr>";
        mode = "t";
      }
      {
        key = "<M-\\>";
        action = "<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>";
        mode = "t";
      }
      {
        key = "<M-]>";
        action = "<cmd>exe v:count1 . \"ToggleTerm direction=vertical size=70\"<cr>";
        mode = "t";
      }
      {
        key = "<M-[>";
        action = "<cmd>exe v:count1 . \"ToggleTerm direction=horizontal size=15\"<cr>";
        mode = "t";
      }
      {
        key = "<C-k>";
        action = "<C-\\><C-n><C-w>k";
        mode = "t";
      }
      {
        key = "<C-j>";
        action = "<C-\\><C-n><C-w>j";
        mode = "t";
      }
      {
        key = "<C-h>";
        action = "<C-\\><C-n><C-w>h";
        mode = "t";
      }
    ];
  };
}
