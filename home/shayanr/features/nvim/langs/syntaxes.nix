{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-treesitter.withAllGrammars;
      type = "lua";
      config = ''
        require('nvim-treesitter.configs').setup {
          autopairs = {
            enable = true,
          },
          highlight = {
            enable = true,
            disable = { "" },
            additional_vim_regex_highlighting = false,
          },
          indent = {
            enable = true, 
            disable = { "yaml", "python", "dart" } 
          },
          context_commentstring = {
            enable = true,
            enable_autocmd = false
          }
        }
      '';
    }
  ];
}
