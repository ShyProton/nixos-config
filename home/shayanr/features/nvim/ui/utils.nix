{
  programs.nixvim.plugins = {
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
}
