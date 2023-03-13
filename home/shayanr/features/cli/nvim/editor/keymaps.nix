{ pkgs, ... }:
{
  programs.nixvim = {
    globals.mapleader = " ";

    # WARNING: Vimscript plugin.
    plugins.easyescape.enable = true;

    maps = {
      # Better mapping for escaping.
      command."kj".action = "<esc>";

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
        "<C-x>".action = "<cmd>bd<cr>";
      };
    };
  };
}
