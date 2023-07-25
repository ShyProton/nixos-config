{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };

    registry = {
      # Adds this flake to the registry for easy access (e.g. for templates)
      dotfiles.to = {
        type = "github";
        owner = "ShyProton";
        repo = "nixos-config";
      };
    };
  };
}
