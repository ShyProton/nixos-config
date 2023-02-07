{
  imports = [
    ./sops.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
  };
}
