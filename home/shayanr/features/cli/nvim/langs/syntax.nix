{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      indent = true;
    };

    # Language autocommands.
    autoCmd = [
      {
        event = [ "FileType" ];
        pattern = [ "nix" "html" "css" "js" "json" ];
        command = "setlocal tabstop=2 shiftwidth=2";
      }
      {
        event = [ "FileType" ];
        pattern = [ "nix" ];
        command = "setlocal nosmartindent";
      }
      {
        event = [ "BufWritePre" ];
        command = "lua vim.lsp.buf.format()";
      }
    ];
  };
}
