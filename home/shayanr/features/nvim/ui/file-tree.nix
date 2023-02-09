{
  programs.nixvim.plugins = {
    nvim-tree = {
      enable = true;
      disableNetrw = true;
      hijackNetrw = true;
      hijackCursor = true;
      openOnTab = false;
      syncRootWithCwd = true;
      respectBufCwd = true;

      diagnostics = {
        enable = true;
        icons = {
          hint = " ";
          info = " ";
          warning = " ";
          error = " ";
        };
      };

      git = {
        enable = true;
        ignore = true;
        timeout = 500;
      };

      updateFocusedFile = {
        enable = true;
        updateRoot = true;
      };

      view = {
        width = 30;
        hideRootFolder = false;
        number = false;
        relativenumber = true;
        side = "left";
        mappings = {
          customOnly = false;
          list = [
            { key = [ "l" "<CR>" "o" ]; action = "edit"; }
            { key = [ "h" ]; action = "close_node"; }
            { key = [ "v" ]; action = "vsplit"; }
          ];
        };
      };
    };
  };
}
