{
  programs.nixvim = {
    plugins = {
      gitsigns = {
        enable = true;

        signs = {
          add.text = "▎";
          change.text = "▎";
          delete.text = "契";
          topdelete.text = "契";
          changedelete.text = "▎";
        };
      };
    };

    maps.normal = {
      "<leader>gp".action = "<cmd>Gitsigns preview_hunk_inline<cr>";
      "<leader>gk".action = "<cmd>Gitsigns prev_hunk<cr>";
      "<leader>gj".action = "<cmd>Gitsigns next_hunk<cr>";
      "<leader>gr".action = "<cmd>Gitsigns reset_hunk<cr>";
      "<leader>gb".action = "<cmd>Gitsigns toggle_current_line_blame<cr>";
      "<leader>gd".action = "<cmd>Gitsigns toggle_deleted<cr>";
    };
  };
}
