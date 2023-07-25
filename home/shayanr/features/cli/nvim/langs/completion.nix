{pkgs, ...}: let
  # TODO: Probably needs to be a Lua string.
  kind_icons = ''    {
       Text = "",
       Method = "m",
       Function = "",
       Constructor = "",
       Field = "",
       Variable = "",
       Class = "",
       Interface = "",
       Module = "",
       Property = "",
       Unit = "",
       Value = "",
       Enum = "",
       Keyword = "",
       Snippet = "",
       Color = "",
       File = "",
       Reference = "",
       Folder = "",
       EnumMember = "",
       Constant = "",
       Struct = "",
       Event = "",
       Operator = "",
       TypeParameter = "",
     } '';
in {
  programs.nixvim = {
    plugins = {
      nvim-cmp = {
        enable = true; # Autocompletion.

        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
          {name = "buffer";}
        ];

        snippet.expand = "luasnip";

        formatting = {
          fields = ["kind" "abbr" "menu"];
          format = ''
            function(entry, vim_item)
              vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[LUA]",
                luasnip = "[SNIP]",
                buffer = "[BUF]",
                path = "[PATH]",
              })[entry.source.name]
              return vim_item
            end
          '';
        };

        mapping = {
          "<cr>" = "cmp.mapping.confirm({ select = true })";

          "<Tab>" = {
            modes = ["i" "s"];
            action = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expandable() then
                  luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end
            '';
          };

          "<S-Tab>" = {
            modes = ["i" "s"];
            action = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end
            '';
          };
        };
      };

      luasnip = {
        enable = true;
        fromVscode = [{}];
      };

      cmp-nvim-lsp.enable = true; # Lsp completions.
      cmp_luasnip.enable = true; # Snippet Completions.
      cmp-path.enable = true; # File path completions.
      cmp-buffer.enable = true; # Buffer completions.
    };

    extraPlugins = with pkgs.vimPlugins; [
      friendly-snippets
    ];

    # Utilities needed for proper functionality of nvim-cmp.
    extraConfigLua = ''
      luasnip = require('luasnip')

      kind_icons = ${kind_icons}

      check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
      end
    '';
  };
}
