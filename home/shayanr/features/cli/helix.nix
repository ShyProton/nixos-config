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
        vscode-html-language-server.command = "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server";
        vscode-css-language-server.command = "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server";
        vscode-json-language-server.command = "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server";
        typescript-language-server.command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
        pyright = {
          command = "${pkgs.pyright}/bin/pyright-langserver";
          args = ["--stdio"];
        };
        svelteserver.command = "${pkgs.svelte-language-server}/bin/svelteserver";
        tailwindcss-language-server.command = "${pkgs.tailwindcss-language-server}/bin/tailwindcss-language-server";
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
        {
          name = "html";
          auto-format = true;
        }
        {
          name = "css";
          auto-format = true;
        }
        {
          name = "javascript";
          auto-format = true;
        }
        {
          name = "typescript";
          auto-format = true;
        }
        {
          name = "svelte";
          auto-format = true;
          language-servers = ["svelteserver" "tailwindcss-language-server"];
        }
        {
          name = "python";
          auto-format = true;
          roots = ["pyproject.toml"];
          formatter = {
            command = "${pkgs.black}/bin/black";
            args = ["--quiet" "-"];
          };
          language-servers = ["pyright"];
        }
        {name = "bash";}
      ];
    };
  };
}
