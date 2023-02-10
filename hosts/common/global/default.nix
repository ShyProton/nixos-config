{
  imports = [
    ./age.nix
    ./persistence.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
  };

  nix.settings = {
    warn-dirty = false;
    experimental-features = [ "nix-command" "flakes" ];
  };
}