{lib, ...}: {
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
          number = false;
          relativenumber = true;
          side = "left";
        };

        onAttach.__raw = let
          keymap = mode: map: fn: desc: ''
            vim.keymap.set('${mode}', '${map}', ${fn}, opts('${desc}'))
          '';

          mappings = [
            # DEFAULT MAPPINGS:
            (keymap "n" "<C-]>" "api.tree.change_root_to_node" "CD")
            (keymap "n" "<C-e>" "api.node.open.replace_tree_buffer" "Open: In Place")
            (keymap "n" "<S-k>" "api.node.show_info_popup" "Info")
            (keymap "n" "<C-r>" "api.fs.rename_sub" "Rename: Omit Filename")
            (keymap "n" "<C-t>" "api.node.open.tab" "Open: New Tab")
            (keymap "n" "<C-v>" "api.node.open.vertical" "Open: Vertical Split")
            (keymap "n" "<C-s>" "api.node.open.horizontal" "Open: Horizontal Split")
            (keymap "n" "<BS>" "api.node.navigate.parent_close" "Close Directory")
            (keymap "n" "<CR>" "api.node.open.edit" "Open")
            (keymap "n" "<Tab>" "api.node.open.preview" "Open Preview")
            (keymap "n" ">" "api.node.navigate.sibling.next" "Next Sibling")
            (keymap "n" "<" "api.node.navigate.sibling.prev" "Previous Sibling")
            (keymap "n" "." "api.node.run.cmd" "Run Command")
            (keymap "n" "-" "api.tree.change_root_to_parent" "Up")
            (keymap "n" "a" "api.fs.create" "Create")
            (keymap "n" "bmv" "api.marks.bulk.move" "Move Bookmarked")
            (keymap "n" "B" "api.tree.toggle_no_buffer_filter" "Toggle No Buffer")
            (keymap "n" "c" "api.fs.copy.node" "Copy")
            (keymap "n" "C" "api.tree.toggle_git_clean_filter" "Toggle Git Clean")
            (keymap "n" "[c" "api.node.navigate.git.prev" "Prev Git")
            (keymap "n" "]c" "api.node.navigate.git.next" "Next Git")
            (keymap "n" "d" "api.fs.remove" "Delete")
            (keymap "n" "D" "api.fs.trash" "Trash")
            (keymap "n" "E" "api.tree.expand_all" "Expand All")
            (keymap "n" "e" "api.fs.rename_basename" "Rename: Basename")
            (keymap "n" "]e" "api.node.navigate.diagnostics.next" "Next Diagnostic")
            (keymap "n" "[e" "api.node.navigate.diagnostics.prev" "Prev Diagnostic")
            (keymap "n" "F" "api.live_filter.clear" "Clean Filter")
            (keymap "n" "f" "api.live_filter.start" "Filter")
            (keymap "n" "g?" "api.tree.toggle_help" "Help")
            (keymap "n" "gy" "api.fs.copy.absolute_path" "Copy Absolute Path")
            (keymap "n" "H" "api.tree.toggle_hidden_filter" "Toggle Dotfiles")
            (keymap "n" "I" "api.tree.toggle_gitignore_filter" "Toggle Git Ignore")
            (keymap "n" "J" "api.node.navigate.sibling.last" "Last Sibling")
            (keymap "n" "K" "api.node.navigate.sibling.first" "First Sibling")
            (keymap "n" "m" "api.marks.toggle" "Toggle Bookmark")
            (keymap "n" "o" "api.node.open.edit" "Open")
            (keymap "n" "O" "api.node.open.no_window_picker" "Open: No Window Picker")
            (keymap "n" "p" "api.fs.paste" "Paste")
            (keymap "n" "P" "api.node.navigate.parent" "Parent Directory")
            (keymap "n" "q" "api.tree.close" "Close")
            (keymap "n" "r" "api.fs.rename" "Rename")
            (keymap "n" "R" "api.tree.reload" "Refresh")
            (keymap "n" "s" "api.node.run.system" "Run System")
            (keymap "n" "S" "api.tree.search_node" "Search")
            (keymap "n" "U" "api.tree.toggle_custom_filter" "Toggle Hidden")
            (keymap "n" "W" "api.tree.collapse_all" "Collapse")
            (keymap "n" "x" "api.fs.cut" "Cut")
            (keymap "n" "y" "api.fs.copy.filename" "Copy Name")
            (keymap "n" "Y" "api.fs.copy.relative_path" "Copy Relative Path")
            (keymap "n" "<2-LeftMouse>" "api.node.open.edit" "Open")
            (keymap "n" "<2-RightMouse>" "api.tree.change_root_to_node" "CD")

            # CUSTOM MAPPINGS:
            (keymap "n" "l" "api.node.open.edit" "Open")
            (keymap "n" "<CR>" "api.node.open.edit" "Open")
            (keymap "n" "o" "api.node.open.edit" "Open")
            (keymap "n" "h" "api.node.navigate.parent_close" "Close Directory")
          ];
        in ''
          function(bufnr)
            local api = require('nvim-tree.api')

            local function opts(desc)
              return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            ${lib.concatStrings mappings}
          end
        '';
      };
    };

    keymaps = [
      {
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<cr>";
        mode = "n";
      }
    ];
  };
}
