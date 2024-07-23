{config, ...}: let
  inherit (config.window-decorations) gap-size border-radius;
  inherit (config.colorScheme) palette;

  toPx = num: "${toString num}px";
in ''
  * {
    font-family: "Roboto Mono";
  }

  .control-center {
    opacity: 1;
    background-color: #${palette.base01};
    border-radius: ${toPx border-radius};
    border: 2px solid #${palette.base04};
  }

  .notification {
    border-radius: ${toPx border-radius};
    border: 1px solid #${palette.base04};
  }

  .notification-content {
    padding: 10px;
  }

  .widget-mpris {
    color: #${palette.base06};
    border-radius: ${toPx border-radius};
  }

  .widget-mpris-player {
    border-radius: ${toPx border-radius};
  }

  .widget-mpris-album-art {
    border-radius: ${toPx border-radius};
  }

  .widget-mpris button {
    color: alpha(#${palette.base06}, 0.6);
    border-radius: ${toPx border-radius};
  }

  .widget-mpris button:hover {
    color: #${palette.base06};
    background-color: alpha(#${palette.base03}, 0.7);
    box-shadow: none;
  }

  .widget-mpris-title {
    font-weight: bold;
    font-size: 1.25rem;
  }

  .widget-mpris-subtitle {
    font-size: 1.1rem;
  }
''
