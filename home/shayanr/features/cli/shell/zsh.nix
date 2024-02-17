{
  pkgs,
  config,
  osConfig,
  lib,
  ...
}:
# NOTE: Only configures zsh if it's defined as the default user shell.
lib.mkIf (osConfig.users.users.shayanr.shell == pkgs.zsh) {
  programs = {
    zsh = lib.mkMerge [
      {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        defaultKeymap = "viins";

        history = {
          save = 10000;
          path = "/persist${config.home.homeDirectory}/.zsh_history";
        };

        initExtra = ''
          KEYTIMEOUT=1
        '';
      }

      # WARN: Check if this breaks when the hyprland module is not in imports.
      # Enter Hyprland when logging into tty1 if Hyprland is enabled.
      (lib.mkIf config.wayland.windowManager.hyprland.enable {
        loginExtra = ''
          if [ "$(tty)" = "/dev/tty1" ]; then
            exec Hyprland &> /dev/null
          fi
        '';

        profileExtra = ''
          if [ "$(tty)" = "/dev/tty1" ]; then
            exec Hyprland &> /dev/null
          fi
        '';
      })
    ];

    # Enable starship prompt integration if it's enabled.
    starship.enableZshIntegration =
      lib.mkIf
      config.programs.starship.enable
      true;

    # Enable yazi prompt integration if it's enabled.
    yazi.enableZshIntegration =
      lib.mkIf
      config.programs.starship.enable
      true;
  };
}
