{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
    };
  };
}
