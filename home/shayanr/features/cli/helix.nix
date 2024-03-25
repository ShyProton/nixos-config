{pkgs, ...}: {
  programs.helix = {
    enable = true;

    settings = {
      theme = "gruvbox";

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

    languages = {
      language-server = {
        nil.command = "${pkgs.nil}/bin/nil";
        clangd.command = "${pkgs.clang-tools}/bin/clangd";
        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          config.check = {
            command = "clippy";
            extraArgs = [
              "--"
              "-Wclippy::pedantic"
              "-Wclippy::nursery"
              "-Wclippy::unwrap_used"
              "-Wclippy::expect_used"
            ];
          };
        };
      };

      language = [
        {name = "rust";}
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.alejandra}/bin/alejandra";
        }
        {
          name = "c";
          auto-format = true;
          formatter.command = "${pkgs.clang-tools}/bin/clang-format";
        }
        {
          name = "cpp";
          auto-format = true;
          formatter.command = "${pkgs.clang-tools}/bin/clang-format";
        }
        {name = "svelte";}
        {name = "bash";}
      ];
    };
  };
}
