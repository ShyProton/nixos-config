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

    keymaps = [
      {
        key = "<leader>gp";
        action = "<cmd>Gitsigns preview_hunk_inline<cr>";
        mode = "n";
      }
      {
        key = "<leader>gk";
        action = "<cmd>Gitsigns prev_hunk<cr>";
        mode = "n";
      }
      {
        key = "<leader>gj";
        action = "<cmd>Gitsigns next_hunk<cr>";
        mode = "n";
      }
      {
        key = "<leader>gr";
        action = "<cmd>Gitsigns reset_hunk<cr>";
        mode = "n";
      }
      {
        key = "<leader>gb";
        action = "<cmd>Gitsigns toggle_current_line_blame<cr>";
        mode = "n";
      }
      {
        key = "<leader>gd";
        action = "<cmd>Gitsigns toggle_deleted<cr>";
        mode = "n";
      }
    ];
  };
}
