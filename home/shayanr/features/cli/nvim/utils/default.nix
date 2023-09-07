{
  imports = [
    ./editing.nix # For editing files.
    ./terminal.nix # Accessing the terminal within neovim.
    ./git.nix # Git utilities.
    ./project.nix # For setting working dir.
    ./finder.nix # For finding files.
    # ./presence.nix # Discord rich presence. # FIXME: Doesn't work with WebCord.
  ];

  # Plugins without extra configs.
  programs.nixvim.plugins = {
    comment-nvim.enable = true; # Comment toggling.
    surround.enable = true; # Editing 'surroundings'.
    hardtime.enable = true; # Prevents bad habits.
  };
}
