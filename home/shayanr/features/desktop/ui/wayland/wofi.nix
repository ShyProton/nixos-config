{
  pkgs,
  config,
  ...
}: let
  inherit (config.window-decorations) gap-size border-radius;
  inherit (config.colorScheme) palette;

  toPx = num: "${toString num}px";

  powermenu = let
    width = 250;
    height = 210;
  in
    pkgs.writeShellScriptBin "powermenu" ''
      op=$(
        echo -e " Lock\n Suspend\n Logout\n Reboot\n Poweroff" |
        wofi -i --dmenu --cache-file /dev/null \
          --width ${toString width} --height ${toString height} \
          --y ${toString ((builtins.head config.monitors).height - height - gap-size)} |
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
      x = gap-size;
      y = gap-size;
      width = "25%";
      height = "60%";
    };
    style = ''
      window {
        opacity: 0.95;
        border: 1px;
        border-color: #${palette.base05};
        border-radius: ${toPx border-radius};
        font-family: "Roboto Mono";
        font-size: 18px;
      }

      #input {
        border-radius: ${toPx border-radius} ${toPx border-radius} 0px 0px;
        border:  1px;
        padding: 10px;
        margin: 0px;
        font-size: 28px;
        color: #${palette.base0C};
        background-color: #${palette.base03};
      }

      #input:first-child > :nth-child(1) {
        min-height: 1.25em;
        min-width: 1.25em;
        color: #${palette.base06}
      }

      #input:first-child > :nth-child(4){
        min-height: 1.25em;
        min-width: 1.25em;
        color: #${palette.base06}
      }

      #inner-box {
        margin: 0px;
        color: #${palette.base06};
        background-color: #${palette.base01};
      }

      #outer-box {
        margin: 0px;
        background-color: #${palette.base01};
        border-radius: ${toPx border-radius};
      }

      #entry {
        padding: 0px;
        margin: 0px;
        background-color: #${palette.base01};
      }

      #entry:selected {
        background-color: #${palette.base0D};
        border-radius: ${toPx border-radius};
      }

      #scroll {
        margin: 5px;
        background-color: #${palette.base01};
      }

      #text {
        margin: 0px;
        padding: 2px 2px 2px 10px;
      }

      #text:selected {
        color: #${palette.base00};
        background-color: #${palette.base0D};
        font-weight: bold;
      }

      #img {
        border-radius: ${toPx border-radius};
      }

      #img:selected {
        background-color: #${palette.base0D};
      }
    '';
  };
}
