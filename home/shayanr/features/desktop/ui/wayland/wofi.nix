{
  pkgs,
  config,
  ...
}: let
  window-gap = 10;

  colors = config.colorScheme.colors;

  powermenu = pkgs.writeShellScriptBin "powermenu" ''
    op=$(
      echo -e " Lock\n Suspend\n Logout\n Reboot\n Poweroff" |
      wofi -i --dmenu --width 250 --height 210 --cache-file /dev/null \
        --y ${toString ((builtins.head config.monitors).height - 210 - window-gap)} |
      awk '{print tolower($2)}'
    )

    case $op in
      lock)
        swaylock;;
      suspend)
        systemctl suspend;;
      logout)
        hyprctl dispatch exit;;
      reboot)
        reboot;;
      poweroff)
        poweroff;;
    esac
  '';
in {
  home.packages = [powermenu];

  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus";
  };

  programs.wofi = {
    enable = true;
    settings = {
      image_size = 36;
      allow_images = true;
      insensitive = true;
      run-exec_search = true;
      x = window-gap;
      y = window-gap;
      width = "25%";
      height = "60%";
    };
    style = ''
      window {
        opacity: 0.95;
        border: 1px;
        border-color: #${colors.base05};
        border-radius: 10px;
        font-family: "Roboto Mono";
        font-size: 18px;
      }

      #input {
        border-radius: 10px 10px 0px 0px;
        border:  1px;
        padding: 10px;
        margin: 0px;
        font-size: 28px;
        color: #${colors.base0C};
        background-color: #${colors.base03};
      }

      #input:first-child > :nth-child(1) {
        min-height: 1.25em;
        min-width: 1.25em;
        color: #${colors.base06}
      }

      #input:first-child > :nth-child(4){
        min-height: 1.25em;
        min-width: 1.25em;
        color: #${colors.base06}
      }

      #inner-box {
        margin: 0px;
        color: #${colors.base06};
        background-color: #${colors.base01};
      }

      #outer-box {
        margin: 0px;
        background-color: #${colors.base01};
        border-radius: 5px;
      }

      #entry {
        padding: 0px;
        margin: 0px;
        background-color: #${colors.base01};
      }

      #entry:selected {
        background-color: #${colors.base0D};
        border-radius: 5px;
      }

      #scroll {
        margin: 5px;
        background-color: #${colors.base01};
      }

      #text {
        margin: 0px;
        padding: 2px 2px 2px 10px;
      }

      #text:selected {
        color: #${colors.base00};
        background-color: #${colors.base0D};
        font-weight: bold;
      }

      #img {
        border-radius: 5px;
      }

      #img:selected {
        background-color: #${colors.base0D};
      }
    '';
  };
}
