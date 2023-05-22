{
  programs.nixvim = {
    plugins = {
      nvim-tree = {
        enable = true;
        disableNetrw = true;
        hijackNetrw = true;
        hijackCursor = true;
        syncRootWithCwd = true;
        respectBufCwd = true;

        tab.sync.open = false;

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
        };

        onAttach.__raw = ''
          function(bufnr)
            local api = require('nvim-tree.api')

            local function opts(desc)
              return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
            vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
            vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
            vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
            vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
          end
        '';
      };
    };

    maps.normal = {
      "<leader>e".action = "<cmd>NvimTreeToggle<cr>";
    };
  };
}
