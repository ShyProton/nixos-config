{
  imports = [
    ./editing.nix # For editing files.
    ./terminal.nix # Accessing the terminal within neovim.
    ./git.nix # Git utilities.
    ./project.nix # For setting working dir.
    ./finder.nix # For finding files.
  ];
}
