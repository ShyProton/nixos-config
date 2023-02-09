{ pkgs, ... }:
{
  programs.nixvim = {
    globals.mapleader = " ";

    plugins.easyescape.enable = true;

    maps = {
      # Better mapping for escaping.
      command."kj".action = "<esc>";

      normal = {

        # -- LEADER COMMANDS --
        # NvimTree.
        "<leader>e".action = "<cmd>NvimTreeToggle<cr>";

        # Gitsigns.
        "<leader>gp".action = "<cmd>Gitsigns preview_hunk_inline<cr>";
        "<leader>gk".action = "<cmd>Gitsigns prev_hunk<cr>";
        "<leader>gj".action = "<cmd>Gitsigns next_hunk<cr>";
        "<leader>gr".action = "<cmd>Gitsigns reset_hunk<cr>";
        "<leader>gb".action = "<cmd>Gitsigns toggle_current_line_blame<cr>";
        "<leader>gd".action = "<cmd>Gitsigns toggle_deleted<cr>";

        # Lspsaga.
        "<leader>o".action = "<cmd>Lspsaga outline<cr>";

        # -- NORMAL COMMANDS --
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

        # Lspsaga.
        "<S-k>".action = "<cmd>Lspsaga hover_doc<cr>";
        "<A-k>".action = "<cmd>Lspsaga show_line_diagnostics<cr>";
        "<S-f>".action = "<cmd>Lspsaga lsp_finder";
        "<A-a>".action = "<cmd>Lspsaga code_action<cr>";
        "<S-r>".action = "<cmd>Lspsaga rename<cr>";

        # Bufferline.
        "<S-l>".action = "<cmd>BufferLineCycleNext<cr>";
        "<S-h>".action = "<cmd>BufferLineCyclePrev<cr>";
        "<A-l>".action = "<cmd>BufferLineMoveNext<cr>";
        "<A-h>".action = "<cmd>BufferLineMovePrev<cr>";
      };
    };
  };
}
