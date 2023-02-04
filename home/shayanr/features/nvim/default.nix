{
  imports = [
    # Editor configurations.
    ./options.nix
    ./keymaps.nix

    # Language support.
    # ./syntaxes.nix
    # ./lsp.nix

    # Aesthetics.
    ./theme.nix
    ./ui
  ];

  programs.nixvim.enable = true;
}
