{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      defaults = {
        prompt_prefix = "   ";
        path_display = [ "smart" ];
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

    maps.normal = {
      "<leader>ff".action = "<cmd>Telescope find_files theme=dropdown<cr>";
      "<leader>fg".action = "<cmd>Telescope live_grep theme=dropdown<cr>";
      "<leader>fb".action = "<cmd>Telescope buffers theme=dropdown<cr>";
      "<leader>fh".action = "<cmd>Telescope help_tags theme=dropdown<cr>";
    };
  };
}
