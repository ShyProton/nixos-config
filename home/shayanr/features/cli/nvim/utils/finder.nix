{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      defaults = {
        prompt_prefix = "   ";
        path_display = ["smart"];
        layout_strategy = "vertical";
        sorting_strategy = "ascending";

        vimgrep_arguments = [
          "rg"
          "-L"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
        ];
      };
    };

    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files theme=dropdown<cr>";
        mode = "n";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep theme=dropdown<cr>";
        mode = "n";
      }

      {
        key = "<leader>fb";
        action = "<cmd>Telescope buffers theme=dropdown<cr>";
        mode = "n";
      }
      {
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags theme=dropdown";
        mode = "n";
      }
    ];
  };
}
