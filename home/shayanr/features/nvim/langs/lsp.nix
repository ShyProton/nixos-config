{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        rnix-lsp.enable = true;
      };
    };

    lspsaga = {
      enable = true;

      headers = {
        hint = " ";
        info = " ";
        warning = " ";
        error = " ";
      };

      signs = {
        hint = " ";
        info = " ";
        warning = " ";
        error = " ";
      };

      keys = {
        finderAction = {
          quit = "q";
          vsplit = "v";

          scrollDown = "<Tab>";
          scrollUp = "<S-Tab>";
        };

        codeAction = {
          quit = "q";
        };
      };

      icons = {
        codeAction = "";
      };
    };
  };
}
