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
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" "diff" ];
          lualine_c = [ "diagnostics" ];
          lualine_x = [ "" ];
          lualine_y = [ "filetype" ];
          lualine_z = [ "progress" "location" ];
        };
      };
    };

    maps.normal = {
      "<S-l>".action = "<cmd>BufferLineCycleNext<cr>";
      "<S-h>".action = "<cmd>BufferLineCyclePrev<cr>";
      "<A-l>".action = "<cmd>BufferLineMoveNext<cr>";
      "<A-h>".action = "<cmd>BufferLineMovePrev<cr>";
    };
  };
}
