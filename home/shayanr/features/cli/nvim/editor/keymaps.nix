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

    maps = {
      normal = {
        # Window navigation.
        "<C-k>".action = "<C-w>k";
        "<C-j>".action = "<C-w>j";
        "<C-l>".action = "<C-w>l";
        "<C-h>".action = "<C-w>h";

        # Arrow window resizing.
        "<C-Up>".action = "<cmd>resize +2<cr>";
        "<C-Down>".action = "<cmd>resize -2<cr>";
        "<C-Right>".action = "<cmd>vertical resize +2<cr>";
        "<C-Left>".action = "<cmd>vertical resize -2<cr>";

        # Close buffer.
        "<C-q>".action = "<cmd>bd<cr>";
      };
    };
  };
}
