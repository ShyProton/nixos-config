{
  programs.nixvim.plugins.lsp.servers.rust-analyzer = {
    installCargo = false;
    installRustc = false;
    settings.check.overrideCommand = [
      "cargo"
      "clippy"
      "--workspace"
      "--message-format=json"
      "--all-targets"
      "--all-features"
      "--"
      "-Wclippy::pedantic"
      "-Wclippy::nursery"
      "-Wclippy::unwrap_used"
      "-Wclippy::expect_used"
    ];
  };
}
