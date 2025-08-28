{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      krita
      beeref
    ];

    persistence."/persist${config.home.homeDirectory}" = {
      directories = [
        ".local/share/krita"
        ".config/OpenTabletDriver" # NOTE: Maybe a better place for this one.
      ];

      files = [
        ".config/kritadisplayrc"
        ".config/kritarc"
        ".config/kritashortcutsrc"
      ];
    };
  };
}
