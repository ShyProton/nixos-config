# TODO: Clean up this mess of a file!!
# Perhaps isolate language-specific options to their own directories?
{pkgs, ...}: {
  imports = [
    ./snippets # Custom code snippets.
  ];

  home.packages = with pkgs; [
    lldb
  ];

  home.sessionVariables.COPILOT_API_KEY = "$(cat ~/Desktop/copilot-api-key.txt)";
  xdg.configFile."zls.json".text = ''
    {
      "enable_build_on_save": true,
      "build_on_save_args": ["install", "-Dtarget=wasm32-wasi", "-fwasmtime"]
    }
  '';

  xdg.configFile."clangd/config.yaml".text = ''
    CompileFlags:
      Add: [-pedantic, -Wall, -Wextra]
  '';

  xdg.configFile."golangci/golangci.yaml".text = ''
    linters:
      disable:
        - forbidigo
        - varnamelen
        - depguard
        - gofmt
        - goimports
        - gofumpt
        - gci
  '';

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

    languages = {
      language-server = {
        nil.command = "${pkgs.nil}/bin/nil";
        zls.command = "${pkgs.zls}/bin/zls";
        gopls.command = "${pkgs.gopls}/bin/gopls";
        golangci-lint-langserver = {
          command = "${pkgs.golangci-lint-langserver}/bin/golangci-lint-langserver";
          config.command = [
            "${pkgs.golangci-lint}/bin/golangci-lint"
            "run"
            "--enable-all"
            "--out-format"
            "json"
            "--config"
            "~/.config/golangci/golangci.yaml"
            "--issues-exit-code=1"
          ];
        };
        clangd.command = "${pkgs.clang-tools}/bin/clangd";
        vscode-html-language-server.command = "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server";
        vscode-css-language-server.command = "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server";
        vscode-json-language-server.command = "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server";
        typescript-language-server.command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
        pyright = {
          command = "${pkgs.pyright}/bin/pyright-langserver";
          args = ["--stdio"];
        };
        lua-language-server.command = "${pkgs.lua-language-server}/bin/lua-language-server";
        gpt = {
          command = "${pkgs.helix-gpt}/bin/helix-gpt";
          args = [
            "--handler"
            "copilot"
            "--copilotModel"
            "claude-3.5-sonnet"
          ];
        };
        pico8-ls = {
          command = "${pkgs.nodejs}/bin/node";
          args = [
            "${pkgs.vscode-extensions.pollywoggames.pico8-ls}/share/vscode/extensions/PollywogGames.pico8-ls/server/out-min/main.js"
            "--stdio"
          ];
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
        {
          name = "rust";
          language-servers = ["rust-analyzer"];
        }
        {
          name = "go";
          auto-format = true;
          language-servers = ["gopls" "golangci-lint-langserver"];
        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.alejandra}/bin/alejandra";
          language-servers = ["nil" "gpt"];
        }
        {
          name = "c";
          auto-format = true;
          formatter.command = "${pkgs.clang-tools}/bin/clang-format";
          language-servers = ["clangd"];
        }
        {
          name = "cpp";
          auto-format = true;
          formatter.command = "${pkgs.clang-tools}/bin/clang-format";
          language-servers = ["clangd"];
        }
        {
          name = "html";
          auto-format = true;
          language-servers = ["vscode-html-language-server"];
        }
        {
          name = "css";
          auto-format = true;
          language-servers = ["vscode-css-language-server"];
        }
        {
          name = "javascript";
          auto-format = true;
          language-servers = ["typescript-language-server"];
        }
        {
          name = "typescript";
          auto-format = true;
          language-servers = ["typescript-language-server"];
        }
        {
          name = "svelte";
          auto-format = true;
          language-servers = ["svelteserver" "tailwindcss-language-server"];
        }
        {
          name = "zig";
          auto-format = true;
          language-servers = ["zls"];
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
        {
          name = "lua";
          auto-format = true;

          # TODO: How the hell do I do this
          # formatter = {
          #   command = "${pkgs.stylua}/bin/stylua";
          #   args = ["-"];
          # };
          # formatter = {
          #   command = "${pkgs.nodejs}/bin/node";
          #   args = [
          #     "${pkgs.vscode-extensions.pollywoggames.pico8-ls}/share/vscode/extensions/PollywogGames.pico8-ls/server/out-min/main.js"
          #     "--stdio"
          #   ];
          # };

          language-servers = ["pico8-ls"];
        }
      ];
    };
  };
}
