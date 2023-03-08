# TODO Condense this better with the use of classes.
{ colors, ... }:
''
  window#waybar {
    color: #${colors.base00};
    background: shade(alpha(#${colors.base00}, 0.25), 0.25);
    font-family: "Roboto Mono";
  }

  #custom-nixos {
    background-image: linear-gradient(
      -45deg,
      #${colors.base0C} 0%, #${colors.base0D} 100%
    );
    font-size: 1.5em;
    border-radius: 0 5px 5px 0;
    padding: 10px 0;
  }

  #workspaces {
    background-color: #${colors.base0E};
    font-size: 1em;
    border-radius: 5px;
    margin-top: 10px;
    border-radius: 0 5px 5px 0;
  }

  #workspaces button {
    color: #${colors.base00};
    padding: 0;
    margin: 0;
  }

  #workspaces button.focused {
    color: #${colors.base01};
  }

  #cpu.icon {
    font-size: 1.8em;
    background-color: #${colors.base0A};
    border-radius: 0 5px 0 0;
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
    border-radius: 0 0 5px 0;
    font-weight: bold;
  }

  #network.icon {
    font-size: 1.8em;
    background-color: #${colors.base0D};
    border-radius: 0 5px 0 0;
    margin-top: 10px;
  }

  #network.strength {
    background-color: #${colors.base0D};
    border-radius: 0 0 5px 0;
    font-weight: bold;
  }

  #battery.icon {
    font-size: 1.8em;
    background-color: #${colors.base0B};
    padding: 5px 0 3px 0;
    border-radius: 0 5px 0 0;
    margin-top: 10px;
  }

  #battery.percentage {
    font-weight: bold;
    background-color: #${colors.base0B};
    border-radius: 0 0 5px 0;
  }

  #battery.plugged:not(.percentage) {
    /* HACK: Fixes oddity where charging icon is slightly smaller */
    font-size: 2.2em;
    padding: 3px 0 0 0;
  }

  #battery.charging:not(.percentage) {
    /* HACK: Fixes oddity where charging icon is slightly smaller */
    font-size: 2.2em;
    padding: 3px 0 0 0;
  }

  #battery.full:not(.percentage) {
    /* HACK: Fixes oddity where charging icon is slightly smaller */
    font-size: 2.2em;
    padding: 3px 0 0 0;
  }

  #clock.icon {
    background-color: #${colors.base05};
    font-size: 1.8em;
    margin-top: 10px;
    border-radius: 0 5px 0 0;
  }

  #clock.time {
    background-color: #${colors.base05};
    font-weight: bold;
    border-radius: 0 0 5px 0;
  }

  #custom-power {
    background-color: #${colors.base08};
    font-size: 1.5em;
    border-radius: 0 5px 5px 0;
    margin-top: 10px;
    padding: 10px 0;
  }
''
