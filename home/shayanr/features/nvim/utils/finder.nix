{
  programs.nixvim.plugins.telescope = {
    enable = true;
    defaults = {
      prompt_prefix = "   ";
      path_display = [ "smart" ];
      layout_strategy = "vertical";
      sorting_strategy = "ascending";
    };
  };
}
