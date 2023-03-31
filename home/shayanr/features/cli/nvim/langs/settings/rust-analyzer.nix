{
  programs.nixvim.plugins.lsp.servers
  .rust-analyzer.settings.check.overrideCommand = [
    "cargo"
    "clippy"
    "--workspace"
    "--message-format=json"
    "--all-targets"
    "--all-features"
    "--"
    "-Wclippy::pedantic"
  ];
}
