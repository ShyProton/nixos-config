{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      indent = true;
    };

    # Language autocommands.
    autoCmd = [
      {
        event = ["FileType"];
        pattern = [
          "nix"
          "html"
          "css"
          "javascript"
          "typescript"
          "svelte"
          "json"
          "jsonc"
          "cpp"
          "h"
        ];
        command = "setlocal tabstop=2 shiftwidth=2";
      }
      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "setlocal nosmartindent";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "setlocal colorcolumn=100";
      }
      {
        event = ["BufWritePre"];
        command = "lua vim.lsp.buf.format()";
      }
    ];
  };
}
