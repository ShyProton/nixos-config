{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        servers = {
          html.enable = true;
          cssls.enable = true;
          tsserver.enable = true;
          jsonls.enable = true;

          texlab.enable = true;

          pyright.enable = true;
          rust-analyzer.enable = true;
          clangd.enable = true;
          nil_ls.enable = true;
          lua-ls.enable = true;
          bashls.enable = true;
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
          codeAction = "";
        };
      };

      trouble = {
        enable = true;
        signs = {
          error = " ";
          warning = " ";
          hint = " ";
          information = " ";
        };
      };
    };

    maps.normal = {
      "<leader>o".action = "<cmd>Lspsaga outline<cr>";
      "<leader>xd".action = "<cmd>Trouble workspace_diagnostics<cr>";

      "<S-k>".action = "<cmd>Lspsaga hover_doc<cr>";
      "<A-k>".action = "<cmd>Lspsaga show_line_diagnostics<cr>";
      "<A-f>".action = "<cmd>Lspsaga lsp_finder<cr>";
      "<A-a>".action = "<cmd>Lspsaga code_action<cr>";
      "<S-r>".action = "<cmd>Lspsaga rename<cr>";
    };
  };
}
