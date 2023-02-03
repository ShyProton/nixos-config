{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # TODO: Check to see if there is a nix-native way of configuring these.
    {
      plugin = lualine-nvim;
      type = "lua";
      config = ''
        local hide_in_width = function()
          return vim.fn.winwidth(0) > 100
        end

        local diagnostics = {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        }

        local branch = {
          'branch',
          icon = "",
        }

        local diff = {
          'diff',
          --[[ symbols = { added = ' ', modified = '柳', removed = ' ' }, ]]
        }

        local encoding = {
          'encoding',
          cond = hide_in_width
        }

        require('lualine').setup({
          options = {
            icons_enabled = true,
            theme = 'catppuccin',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = { 
              'toggleterm', 
              'dashboard', 
              'NvimTree', 
              'Outline', 
              'alpha', 
              'Trouble' 
            },
            always_divide_middle = true,
          },
          sections = {
            lualine_a = { 'mode' },
            lualine_b = { branch, diff },
            lualine_c = { diagnostics },
            -- lualine_x = { "encoding", 'fileformat', 'filetype' },
            lualine_x = { encoding },
            lualine_y = { 'filetype' },
            lualine_z = { 'progress', 'location' },
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {},
          },
          tabline = {},
          extensions = {},
        })
      '';
    }
    {
      plugin = bufferline-nvim;
      type = "lua";
      config = ''
        require('bufferline').setup {
          options = {
            numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
            close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
            right_mouse_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
            left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
            middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"

            indicator = {
              style = 'icon',
              icon = '▎'
            },

            -- buffer_close_icon = ' ',
            modified_icon = '●',
            -- close_icon = ' ',
            left_trunc_marker = '',
            right_trunc_marker = '',
            max_name_length = 30,
            max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
            tab_size = 21,
            diagnostics = 'nvim_lsp', -- | "nvim_lsp" | "coc",
            diagnostics_update_in_insert = false,
            offsets = { 
              { filetype = 'NvimTree', text = 'Project Directory', padding = 0 } 
            },
            show_buffer_icons = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            separator_style = 'slant', -- | "thick" | "thin" | { 'any', 'any' },
            enforce_regular_tabs = false,
            always_show_bufferline = true,
          },
          highlights = require('catppuccin.groups.integrations.bufferline').get()
        }
      '';
    }
  ];
}
