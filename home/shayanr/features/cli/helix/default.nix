{pkgs, ...}: {
  imports = [
    ./langs.nix # Language settings.

    ./snippets # Custom code snippets.
  ];

  home.packages = with pkgs; [
    lldb
  ];

  programs.helix = {
    enable = true;

    settings = {
      theme = "flexoki_dark";

      editor = {
        line-number = "relative";
        bufferline = "always";
        color-modes = true;
        cursorline = true;
        insert-final-newline = false;
        rulers = [80 100];

        lsp = {
          display-inlay-hints = true;
        };

        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        statusline = {
          left = ["mode" "separator" "spinner" "version-control"];
          center = ["file-name" "read-only-indicator" "file-modification-indicator"];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };

        indent-guides = {
          render = true;
          character = "┊";
        };
      };

      keys.insert = {
        up = ["normal_mode" "move_visual_line_up"];
        down = ["normal_mode" "move_visual_line_down"];
        left = ["normal_mode" "move_char_left"];
        right = ["normal_mode" "move_char_right"];
      };
    };
  };
}
