{
  imports = [
    ./sops.nix
    ./persistence.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };
}
