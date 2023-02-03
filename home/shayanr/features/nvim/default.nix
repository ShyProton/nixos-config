{ config, pkgs, ... }:
{
  imports = [
    # Language support
    ./syntaxes.nix
    ./lsp.nix

    # Aesthetics
    ./theme.nix
    ./ui
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # extraConfig = ''
    #   vim.opt.number = true
    #   vim.opt.relativenumber = true
    #   vim.opt.numberwidth = 4
    # '';
  };
}
