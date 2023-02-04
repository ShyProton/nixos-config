{ config, pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
        theme = "catppuccin";
        alwaysDivideMiddle = true;

        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" "diff" ];
          lualine_c = [ "diagnostics" ];
          lualine_x = [ "encoding" ];
          lualine_y = [ "filetype" ];
          lualine_z = [ "progress" "location" ];
        };
      };
    };

    # extraConfigLua = ''
    #   require('lualine').setup {
    #     options = {
    #       icons_enabled = true
    #     }
    #   }
    # '';
  };
}
