{
  imports = [
    ./sops.nix
    ./persistence.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
  };
}
