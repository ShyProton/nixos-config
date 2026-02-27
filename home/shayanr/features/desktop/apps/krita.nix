{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      krita
      beeref
    ];

    persistence."/persist" = {
      directories = [
        ".local/share/krita"
        ".config/OpenTabletDriver" # NOTE: Maybe a better place for this one.
      ];

      files = [
        ".config/kritadisplayrc"
        ".config/kritarc"
        ".config/kritashortcutsrc"
        ".local/share/krita.log"
        ".local/share/krita-sysinfo.log"
      ];
    };
  };
}
