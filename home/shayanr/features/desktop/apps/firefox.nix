{ pkgs, config, inputs, ... }:
let
  # TODO: Check to see if using the flake is necessary.
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  # Essential fonts.
  home.packages = with pkgs; [
    liberation_ttf
    dejavu_fonts
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableFirefoxStudies = true;
        DisablePocket = true;
      };
    };
    profiles.shayanr = {
      extensions = with addons; [
        ublock-origin
        darkreader
        octotree
      ];
      settings = {
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.download.useDownloadDir" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.uiCustomization.state" = ''
          {
            "placements": {
              "widget-overflow-fixed-list": [],
              "nav-bar": [
                "back-button",
                "forward-button",
                "stop-reload-button",
                "home-button",
                "urlbar-container",
                "downloads-button",
                "library-button",
                "_testpilot-containers-browser-action"
              ],
              "toolbar-menubar": ["menubar-items"],
              "TabsToolbar": ["tabbrowser-tabs","new-tab-button","alltabs-button"],
              "PersonalToolbar":["personal-bookmarks"]
            },
            "seen": [
              "save-to-pocket-button",
              "developer-button",
              "ublock0_raymondhill_net-browser-action",
              "_testpilot-containers-browser-action"
            ],
            "dirtyAreaCache": [
              "nav-bar",
              "PersonalToolbar",
              "toolbar-menubar",
              "TabsToolbar",
              "widget-overflow-fixed-list"
            ],
            "currentVersion": 18,
            "newElementCount": 4
          }
        '';
        "dom.security.https_only_mode" = true;
        "identity.fxaccounts.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = true;
      };
    };
  };

  home = {
    sessionVariables = {
      BROWSER = "firefox";
      MOZ_ENABLE_WAYLAND = 1;
    };

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".mozilla/firefox"
    ];
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
