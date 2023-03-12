{ config, lib, ... }:
{
  programs = {
    zsh = lib.mkMerge [
      {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        enableSyntaxHighlighting = true;

        history = {
          save = 10000;
          path = "/persist${config.home.homeDirectory}/.zsh_history";
        };

        shellAliases = {
          ls = "exa --header --icons";
          cat = "bat";
          grep = "rg --colors=line:none --colors=line:style:bold --max-columns=150 --max-columns-preview --smart-case";
        };
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
    starship.enableZshIntegration = lib.mkIf
      config.programs.starship.enable
      true;
  };
}
