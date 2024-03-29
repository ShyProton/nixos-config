{
  pkgs,
  config,
  osConfig,
  lib,
  ...
}:
# NOTE: Only configures nushell if it's defined as the default user shell.
lib.mkIf (osConfig.users.users.shayanr.shell == pkgs.nushell) {
  programs = {
    # Enable starship prompt integration if it's enabled.
    starship = {
      enableNushellIntegration =
        lib.mkIf
        config.programs.starship.enable
        true;

      settings.character.disabled = true;
    };

    nushell = {
      enable = true;

      envFile.text = import ./env.nix;
      configFile.text = import ./config.nix;

      extraConfig = (
        # Completions.
        import ./git.nix
      );
    };
  };

  # WARN: Check if this breaks when the hyprland module is not in imports.
  # Enter Hyprland when logging into tty1 if Hyprland is enabled.
  xdg.configFile."nushell/login.nu".text =
    lib.optionalString
    config.wayland.windowManager.hyprland.enable
    ''
      if (tty) == "/dev/tty1" {
        exec Hyprland | ignore
      }
    '';

  # Persists shell history between reboots.
  home.persistence."/persist${config.home.homeDirectory}".files = [
    ".config/nushell/history.txt"
  ];
}
