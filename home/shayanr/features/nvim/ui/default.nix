{ config, pkgs, ... }:
{
  imports = [
    ./file-tree.nix # File browser.
    ./lines.nix # Top and bottom bars.
    ./utils.nix # UI plugins with functionality.
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    # TODO: Add configurations to each plugin
    # NOTE: The plugins listed here are 'extra'
    {
      plugin = alpha-nvim;
      type = "lua";
      config = ''
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')
        
        dashboard.section.header.val = {
          [[                               __                ]],
          [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
          [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
          [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
          [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
          [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
        dashboard.section.buttons.val = {
          dashboard.button('s', '  Search files', ':Telescope find_files <CR>'),
          dashboard.button('a', '  New file', ':ene <BAR> startinsert <CR>'),
          dashboard.button('p', '  Search projects', ':Telescope projects <CR>'),
          dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
          dashboard.button('g', '  Grep text', ':Telescope live_grep <CR>'),
          dashboard.button('c', '  Configuration', ':e ~/.dotfiles/${config.home.homeDirectory}/features/nvim/default.nix <CR>'),
          dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
        }

        dashboard.section.footer.opts.hl = 'Type'
        dashboard.section.header.opts.hl = 'Include'
        dashboard.section.buttons.opts.hl = 'Keyword'

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
      '';
    }

    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = "require('indent_blankline').setup{}";
    }
    {
      plugin = nvim-colorizer-lua;
      type = "lua";
      config = "require('colorizer').setup{}";
    }
  ];
}
