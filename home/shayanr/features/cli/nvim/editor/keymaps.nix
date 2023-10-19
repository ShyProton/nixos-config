{pkgs, ...}: {
  programs.nixvim = {
    globals.mapleader = " ";

    extraPlugins = with pkgs.vimPlugins; [
      better-escape-nvim
    ];

    extraConfigLua = ''
      require("better_escape").setup {
        mapping = { "kj" },
        timeout = vim.o.timeoutlen,
        clear_empty_lines = false,
        keys = function()
          return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<esc>l" or "<esc>"
        end,
      }
    '';

    keymaps = [
      {
        key = "<C-k>";
        action = "<C-w>k";
        mode = "n";
      }
      {
        key = "<C-j>";
        action = "<C-w>j";
        mode = "n";
      }
      {
        key = "<C-l>";
        action = "<C-w>l";
        mode = "n";
      }
      {
        key = "<C-h>";
        action = "<C-w>h";
        mode = "n";
      }
      {
        key = "<C-Up>";
        action = "<cmd>resize +2<cr>";
        mode = "n";
      }
      {
        key = "<C-Down>";
        action = "<cmd>resize -2<cr>";
        mode = "n";
      }
      {
        key = "<C-Right>";
        action = "<cmd>vertical resize +2<cr>";
        mode = "n";
      }
      {
        key = "<C-Left>";
        action = "<cmd>vertical resize -2<cr>";
        mode = "n";
      }
      {
        key = "<C-q>";
        action = "<cmd>bd<cr>";
        mode = "n";
      }
    ];
  };
}
