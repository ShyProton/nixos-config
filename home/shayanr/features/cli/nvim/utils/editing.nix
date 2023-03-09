{
  # Utilities useful for editing files.
  programs.nixvim.plugins = {
    nvim-autopairs.enable = true;
    nvim-colorizer.enable = true;

    indent-blankline = {
      enable = true;
      useTreesitter = true;
      showCurrentContext = true;
      showTrailingBlanklineIndent = false;
      buftypeExclude = [
        "terminal"
        "nofile"
      ];
      filetypeExclude = [
        "help"
        "startify"
        "dashboard"
        "packer"
        "neogitstatus"
        "NvimTree"
        "Trouble"
      ];
      contextHighlightList = [ "ContextHighlight" ];
    };

    todo-comments = {
      enable = true;
      guiStyle.fg = "BOLD";
    };
  };
}
