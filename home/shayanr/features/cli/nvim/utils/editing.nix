{
  # Utilities useful for editing files.
  programs.nixvim.plugins = {
    nvim-autopairs.enable = true;
    nvim-colorizer.enable = true;

    indent-blankline = {
      enable = true;
      exclude = {
        filetypes = [
          "help"
          "startify"
          "dashboard"
          "packer"
          "neogitstatus"
          "NvimTree"
          "Trouble"
          "lspinfo"
          "checkhealth"
          "gitcommit"
          ""
        ];

        buftypes = [
          "terminal"
          "nofile"
        ];
      };
    };

    todo-comments = {
      enable = true;
      guiStyle.fg = "BOLD";

      keywords = {
        NOTE.icon = "󰵅";
      };
    };
  };
}
