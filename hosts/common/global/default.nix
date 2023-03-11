{
  imports = [
    ./nix.nix # Nix configurations.
    ./sudo.nix # Sudo configurations.
    ./packages.nix # Packages for all machines.
    ./age.nix # Secret management.
    ./persistence.nix # Opt-in persistence configurations.
  ];
}
