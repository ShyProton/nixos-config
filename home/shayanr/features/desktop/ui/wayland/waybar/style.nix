# TODO: Condense this better with the use of classes.
{config, ...}: let
  inherit (config.window-decorations) border-radius;
  inherit (config.colorScheme) palette;

  margins = 10;

  toPx = num: "${toString num}px";
  mkBorderRadius = tl: tr: br: bl: "border-radius: ${toPx tl} ${toPx tr} ${toPx br} ${toPx bl};";
in ''
  window#waybar {
    color: #${palette.base00};
    background: shade(alpha(#${palette.base00}, 0.25), 0.25);
    font-family: "Roboto Mono";
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #custom-nixos {
    background-image: linear-gradient(
      -45deg,
      #${palette.base0C} 0%, #${palette.base0D} 100%
    );
    font-size: 2.5em;
    padding: 0;
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #custom-notification {
    background-color: #${palette.base0A};
    font-size: 1.5em;
    padding: 0;
    margin-top: ${toPx margins};
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #workspaces {
    background-color: #${palette.base0E};
    font-size: 1em;
    margin-top: ${toPx margins};
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #workspaces button {
    color: #${palette.base00};
    padding: 0;
    margin: 0;
  }

  #workspaces button.focused {
    color: #${palette.base01};
  }

  #mpris {
    font-size: 1.8em;
    padding-top: 3px;
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #mpris.spotify {
    background-color: #${palette.base0B};
  }

  #mpris.firefox {
    background-color: #${palette.base09}
  }

  #pulseaudio.icon {
    font-size: 1.8em;
    background-color: #${palette.base0E};
    margin-top: ${toPx margins};
    ${mkBorderRadius 0 border-radius 0 0}
  }

  #pulseaudio.volume {
    background-color: #${palette.base0E};
    font-weight: bold;
    ${mkBorderRadius 0 0 border-radius 0}
  }

  #cpu.icon {
    font-size: 1.8em;
    background-color: #${palette.base0A};
    margin-top: ${toPx margins};
    ${mkBorderRadius 0 border-radius 0 0}
  }

  #cpu.usage {
    background-color: #${palette.base0A};
    font-weight: bold;
  }

  #custom-seperator.sep1 {
    background-image: linear-gradient(180deg, #${palette.base0A} 0%, #${palette.base09} 100%);
    font-weight: bold;
  }

  #memory.icon {
    font-size: 1.8em;
    background-color: #${palette.base09};
  }

  #memory.usage {
    background-color: #${palette.base09};
    font-weight: bold;
  }

  #custom-seperator.sep2 {
    background-image: linear-gradient(180deg, #${palette.base09} 0%, #${palette.base08} 100%);
    font-weight: bold;
  }

  #temperature.icon {
    font-size: 1.8em;
    background-color: #${palette.base08};
  }

  #temperature.temp {
    background-color: #${palette.base08};
    font-weight: bold;
    ${mkBorderRadius 0 0 border-radius 0}
  }

  #network.icon {
    font-size: 2.5em;
    background-color: #${palette.base0D};
    margin-top: ${toPx margins};
    ${mkBorderRadius 0 border-radius 0 0}
  }

  #network.strength {
    background-color: #${palette.base0D};
    font-weight: bold;
    ${mkBorderRadius 0 0 border-radius 0}
  }

  #battery.icon {
    font-size: 2.2em;
    background-color: #${palette.base0B};
    padding: 3px 0 0 0;
    margin-top: ${toPx margins};
    ${mkBorderRadius 0 border-radius 0 0}
  }

  #battery.percentage {
    font-weight: bold;
    background-color: #${palette.base0B};
    ${mkBorderRadius 0 0 border-radius 0}
  }

  #clock.icon {
    background-color: #${palette.base09};
    font-size: 1.8em;
    margin-top: ${toPx margins};
    ${mkBorderRadius 0 border-radius 0 0}
  }

  #clock.time {
    background-color: #${palette.base09};
    font-weight: bold;
    ${mkBorderRadius 0 0 border-radius 0}
  }

  #tray {
    background-color: #${palette.base00};
    padding: 2px 0 2px 0;
    margin-top: ${toPx margins};
    ${mkBorderRadius 0 border-radius border-radius 0}
  }

  #custom-power {
    background-color: #${palette.base08};
    font-size: 2.5em;
    margin-top: ${toPx margins};
    padding: 0;
    ${mkBorderRadius 0 border-radius border-radius 0}
  }
''
