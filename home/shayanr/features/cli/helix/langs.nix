{pkgs, ...}: let
  # -- GENERAL: --
  nix = {
    server.command = "${pkgs.nil}/bin/nil";
    settings = {
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.alejandra}/bin/alejandra";
      language-servers = ["nil"];
    };
  };

  go = {
    server.command = "${pkgs.gopls}/bin/gopls";
    linter = {
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
    settings = {
      name = "go";
      auto-format = true;
      language-servers = ["gopls" "golangci-lint-langserver"];
    };
    extraConf = ''
      linters:
        disable:
          - forbidigo
          - varnamelen
          - depguard
          - gofmt
          - goimports
          - gofumpt
          - gci
          - tenv
    '';
  };

  python = {
    server = {
      command = "${pkgs.pyright}/bin/pyright-langserver";
      args = ["--stdio"];
    };
    settings = {
      name = "python";
      auto-format = true;
      roots = ["pyproject.toml"];
      formatter = {
        command = "${pkgs.black}/bin/black";
        args = ["--quiet" "-"];
      };
      language-servers = ["pyright"];
    };
  };

  c = {
    server.command = "${pkgs.clang-tools}/bin/clangd";
    settings = {
      name = "c";
      auto-format = true;
      formatter.command = "${pkgs.clang-tools}/bin/clang-format";
      language-servers = ["clangd"];
    };
    extraConf = ''
      CompileFlags:
        Add: [-pedantic, -Wall, -Wextra]
    '';
  };

  cpp = {
    server.command = "${pkgs.clang-tools}/bin/clangd";
    settings = {
      name = "cpp";
      auto-format = true;
      formatter = {
        command = "${pkgs.clang-tools}/bin/clang-format";
        args = ["-style=file"];
      };
      language-servers = ["clangd"];
    };
  };

  rust = {
    server = {
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
    settings = {
      name = "rust";
      language-servers = ["rust-analyzer"];
    };
  };

  zig = {
    server.command = "${pkgs.zls}/bin/zls";
    settings = {
      name = "zig";
      auto-format = true;
      language-servers = ["zls"];
    };
    extraConf = ''
      {
        "enable_build_on_save": true,
        "build_on_save_args": ["install", "-Dtarget=wasm32-wasi", "-fwasmtime"]
      }
    '';
  };

  # -- GAME: --
  godot = {
    server = {
      command = "nc";
      formatCommand = "${pkgs.gdtoolkit_4}/bin/gdformat \${INPUT}";
      formatStdin = true;
      args = ["127.0.0.1" "6005"];
      language-id = "gdscript";
    };
    settings = {
      name = "gdscript";
      auto-format = true;
      language-servers = ["gdscript"];
    };
  };

  pico8 = {
    server = {
      command = "${pkgs.nodejs}/bin/node";
      args = [
        "${pkgs.vscode-extensions.pollywoggames.pico8-ls}/share/vscode/extensions/PollywogGames.pico8-ls/server/out-min/main.js"
        "--stdio"
      ];
    };
  };

  lua = {
    server.command = "${pkgs.lua-language-server}/bin/lua-language-server";
    settings = {
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
    };
  };

  # -- WEB: --
  html = {
    server.command = "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server";
    settings = {
      name = "html";
      auto-format = true;
      language-servers = ["vscode-html-language-server"];
    };
  };

  css = {
    server.command = "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server";
    settings = {
      name = "css";
      auto-format = true;
      language-servers = ["vscode-css-language-server"];
    };
  };

  javascript = {
    server.command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
    settings = {
      name = "javascript";
      auto-format = true;
      language-servers = ["typescript-language-server"];
    };
  };

  typescript = {
    server.command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
    settings = {
      name = "typescript";
      auto-format = true;
      language-servers = ["typescript-language-server"];
    };
  };

  json = {
    server.command = "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server";
    settings = {
      name = "json";
      auto-format = true;
      language-servers = ["vscode-json-language-server"];
    };
  };

  tailwind = {
    server.command = "${pkgs.tailwindcss-language-server}/bin/tailwindcss-language-server";
  };

  svelte = {
    server.command = "${pkgs.svelte-language-server}/bin/svelteserver";
    settings = {
      name = "svelte";
      auto-format = true;
      language-servers = ["svelteserver" "tailwindcss-language-server"];
    };
  };
in {
  programs.helix.languages = {
    language-server = {
      # -- GENERAL: --
      nil = nix.server;
      gopls = go.server;
      golangci-lint-langserver = go.linter;
      pyright = python.server;
      clangd = c.server;
      rust-analyzer = rust.server;
      zls = zig.server;

      # -- GAME: --
      gdscript = godot.server;
      pico8-ls = pico8.server;
      lua-language-server = lua.server;

      # -- WEB: --
      vscode-html-language-server = html.server;
      vscode-css-language-server = css.server;
      typescript-language-server = typescript.server;
      vscode-json-language-server = json.server;
      tailwindcss-language-server = tailwind.server;
      svelteserver = svelte.server;
    };

    language = [
      # -- GENERAL: --
      nix.settings
      go.settings
      python.settings
      c.settings
      cpp.settings
      rust.settings
      zig.settings

      # -- GAME: --
      godot.settings
      lua.settings

      # -- WEB: --
      html.settings
      css.settings
      javascript.settings
      typescript.settings
      json.settings
      svelte.settings
    ];
  };

  xdg.configFile = {
    "golangci/golangci.yaml".text = go.extraConf;
    "clangd/config.yaml".text = c.extraConf;
    "zls.json".text = zig.extraConf;
  };
}
