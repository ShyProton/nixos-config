{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      indent = true;
    };

    # Language specific options.
    autoCmd = [
      {
        event = [ "FileType" ];
        pattern = [ "nix" ];
        command = "setlocal tabstop=2 shiftwidth=2";
      }
      {
        event = [ "FileType" ];
        pattern = [ "nix" ];
        command = "setlocal nosmartindent";
      }
    ];
  };
}
