{
  programs.nixvim = {
    plugins = {
      # TODO: Implement 'offsets' option
      bufferline = {
        enable = true;
        numbers = "none";

        modifiedIcon = "●";

        bufferCloseIcon = "";
        closeIcon = "";

        leftTruncMarker = "";
        rightTruncMarker = "";

        maxNameLength = 30;
        maxPrefixLength = 30;

        tabSize = 21;

        diagnostics = "nvim_lsp";
        diagnosticsUpdateInInsert = false;

        showBufferIcons = true;
        showCloseIcon = false;
        showTabIndicators = true;

        persistBufferSort = true;

        separatorStyle = "slant";
        enforceRegularTabs = false;
        alwaysShowBufferline = true;
      };

      lualine = {
        enable = true;
        alwaysDivideMiddle = true;
        globalstatus = true;

        sections = {
          lualine_a = ["mode"];
          lualine_b = [
            {
              name = "branch";
              icon = "";
            }
            "diff"
          ];
          lualine_c = [
            {
              name = "diagnostics";
              extraConfig.symbols = {
                hint = " ";
                info = " ";
                warn = " ";
                error = " ";
              };
            }
          ];
          lualine_x = [""];
          lualine_y = ["filetype"];
          lualine_z = ["progress" "location"];
        };
      };
    };

    keymaps = [
      {
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
        mode = "n";
      }
      {
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        mode = "n";
      }
      {
        key = "<A-l>";
        action = "<cmd>BufferLineMoveNext<cr>";
        mode = "n";
      }
      {
        key = "<A-h>";
        action = "<cmd>BufferLineMovePrev<cr>";
        mode = "n";
      }
    ];
  };
}
