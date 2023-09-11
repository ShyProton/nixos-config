{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        servers = {
          html.enable = true;
          cssls.enable = true;
          tsserver.enable = true;
          jsonls.enable = true;
          svelte.enable = true;

          texlab.enable = true;

          pyright.enable = true;
          rust-analyzer.enable = true;
          clangd.enable = true;

          nil_ls = {
            enable = true;
            settings.formatting.command = ["${pkgs.alejandra}/bin/alejandra"];
          };

          lua-ls.enable = true;
          bashls.enable = true;
        };
      };

      lspsaga = {
        enable = true;

        finder.keys = {
          vsplit = "<C-v>";
          split = "<C-s>";
          toggleOrOpen = "l";
          shuttle = "<C-w>";
        };

        outline.keys = {
          toggleOrJump = "l";
          jump = "o";
        };

        definition.keys = {
          edit = "<cr>";
          vsplit = "<C-v>";
          split = "<C-s>";
        };

        rename.keys.quit = "<C-c>";
        diagnostic.keys.toggleOrJump = "l";

        symbolInWinbar = {
          showFile = false;
          folderLevel = 0;
          separator = " ❯ ";
        };

        codeAction.extendGitSigns = true;
        ui.codeAction = " ";
        lightbulb = {
          virtualText = true;
          sign = false;
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

    # TODO: Do this with NixVim somehow.
    extraConfigLua = ''
      local signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
      end
    '';

    maps.normal = {
      "<leader>o".action = "<cmd>Lspsaga outline<cr>";
      "<leader>x".action = "<cmd>Trouble workspace_diagnostics<cr>";
      "<leader>t".action = "<cmd>TodoTrouble<cr>";

      "<S-k>".action = "<cmd>Lspsaga hover_doc<cr>";
      "<A-k>".action = "<cmd>Lspsaga show_line_diagnostics<cr>";
      "<A-f>".action = "<cmd>Lspsaga finder<cr>";
      "<A-d>".action = "<cmd>Lspsaga peek_definition<cr>";
      "<A-a>".action = "<cmd>Lspsaga code_action<cr>";
      "<S-r>".action = "<cmd>Lspsaga rename<cr>";
    };
  };
}
