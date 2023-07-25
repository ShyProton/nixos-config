{
  pkgs,
  lib,
  inputs,
  ...
}: let
  inherit (inputs.firefox-addons.lib.${pkgs.system}) buildFirefoxXpiAddon;
  addons = inputs.firefox-addons.packages.${pkgs.system};
in {
  # NOTE: Most extensions are currently being configured imperatively.
  programs.firefox.profiles.shayanr.extensions = with addons; [
    ublock-origin
    darkreader
    octotree
    gruvbox-dark-theme
    return-youtube-dislikes
    # NOTE: Custom implementation for sidebery beta.
    (buildFirefoxXpiAddon {
      pname = "sidebery";
      version = "5.0.0b31";
      addonId = "{3c078156-979c-498b-8990-85f7987dd929}";
      url = "https://github.com/mbnuqw/sidebery/releases/download/v5.0.0b31/sidebery-5.0.0b31.xpi";
      sha256 = "sha256-J7N1w7T421c0B/oZJjpJJ4AsL1YpqUYaAkJsY5IhI+Y=";
      meta = with lib; {
        homepage = "https://github.com/mbnuqw/sidebery";
        description = "Tabs tree and bookmarks in sidebar with advanced containers configuration.";
        license = licenses.mit;
        platforms = platforms.all;
      };
    })
  ];
}
