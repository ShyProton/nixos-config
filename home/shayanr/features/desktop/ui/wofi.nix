{ pkgs, config, ... }:
let
  colors = config.colorScheme.colors;
in
{
  home.packages = with pkgs; [ wofi ];

  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus";
  };

  xdg.configFile = {
    "wofi/config".text = ''
      image_size=36
      allow_images=true
      insensitive=true
      run-exec_search=true
      x=10
      y=10
      width=25%
      height=60%
    '';

    "wofi/style.css".text = ''
      window {
        opacity: 0.95;
        border: 1px;
        border-color: ${colors.base05};
        border-radius: 10px;
        font-family: monospace;
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
      }

      #scroll {
        margin: 5px;
        background-color: #${colors.base01};
      }

      #text {
        margin: 0px;
        padding: 2px 2px 2px 10px;
      }
    '';
  };
}
