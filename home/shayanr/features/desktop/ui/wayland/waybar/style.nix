# TODO: Condense this better with the use of classes.
{config, ...}: let
  inherit (config.window-decorations) border-radius;
  inherit (config.colorScheme) colors;

  mkBorderRadius = tl: tr: br: bl: ''
    border-radius: ${toString tl}px ${toString tr}px ${toString br}px ${toString bl}px;
  '';
in ''
  window#waybar {
    color: #${colors.base00};
    background: shade(alpha(#${colors.base00}, 0.25), 0.25);
    font-family: "Roboto Mono";
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #custom-nixos {
    background-image: linear-gradient(
      -45deg,
      #${colors.base0C} 0%, #${colors.base0D} 100%
    );
    font-size: 1.5em;
    padding: 10px 0;
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #workspaces {
    background-color: #${colors.base0E};
    font-size: 1em;
    margin-top: 10px;
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #workspaces button {
    color: #${colors.base00};
    padding: 0;
    margin: 0;
  }

  #workspaces button.focused {
    color: #${colors.base01};
  }

  #mpris {
    font-size: 1.8em;
    padding-top: 3px;
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #mpris.spotify {
    background-color: #${colors.base0B};
  }

  #mpris.firefox {
    background-color: #${colors.base09}
  }

  #pulseaudio.icon {
    font-size: 1.8em;
    background-color: #${colors.base0E};
    margin-top: 10px;
    ${mkBorderRadius 0 border-radius 0 0}
  }

  #pulseaudio.volume {
    background-color: #${colors.base0E};
    font-weight: bold;
    ${mkBorderRadius 0 0 border-radius 0}
  }

  #cpu.icon {
    font-size: 1.8em;
    background-color: #${colors.base0A};
    margin-top: 10px;
    ${mkBorderRadius 0 border-radius 0 0}
  }

  #cpu.usage {
    background-color: #${colors.base0A};
    font-weight: bold;
  }

  #custom-seperator.sep1 {
    background-image: linear-gradient(180deg, #${colors.base0A} 0%, #${colors.base09} 100%);
    font-weight: bold;
  }

  #memory.icon {
    font-size: 1.8em;
    background-color: #${colors.base09};
  }

  #memory.usage {
    background-color: #${colors.base09};
    font-weight: bold;
  }

  #custom-seperator.sep2 {
    background-image: linear-gradient(180deg, #${colors.base09} 0%, #${colors.base08} 100%);
    font-weight: bold;
  }

  #temperature.icon {
    font-size: 1.8em;
    background-color: #${colors.base08};
  }

  #temperature.temp {
    background-color: #${colors.base08};
    font-weight: bold;
    ${mkBorderRadius 0 0 border-radius 0}
  }

  #network.icon {
    font-size: 1.8em;
    background-color: #${colors.base0D};
    margin-top: 10px;
    ${mkBorderRadius 0 border-radius 0 0}
  }

  #network.strength {
    background-color: #${colors.base0D};
    font-weight: bold;
    ${mkBorderRadius 0 0 border-radius 0}
  }

  #battery.icon {
    font-size: 2.2em;
    background-color: #${colors.base0B};
    padding: 3px 0 0 0;
    margin-top: 10px;
    ${mkBorderRadius 0 border-radius 0 0}
  }

  #battery.percentage {
    font-weight: bold;
    background-color: #${colors.base0B};
    ${mkBorderRadius 0 0 border-radius 0}
  }

  #clock.icon {
    background-color: #${colors.base05};
    font-size: 1.8em;
    margin-top: 10px;
    ${mkBorderRadius 0 border-radius 0 0}
  }

  #clock.time {
    background-color: #${colors.base05};
    font-weight: bold;
    ${mkBorderRadius 0 0 border-radius 0}
  }

  #tray {
    background-color: #${colors.base00};
    padding: 2px 0 2px 0;
    margin-top: 10px;
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #custom-power {
    background-color: #${colors.base08};
    font-size: 1.5em;
    margin-top: 10px;
    padding: 10px 0;
    ${mkBorderRadius 0 border-radius border-radius 0}
  }
''
