{ config, pkgs, ... }:
{
  imports = [
    # Language support
    ./syntaxes.nix
    ./lsp.nix

    # Aesthetics
    ./theme.nix
    ./ui.nix
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
    ];

    # extraConfig = { };
  };
}
