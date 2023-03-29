{
  programs.firefox.profiles.shayanr.userChrome = ''
    /* Sidebery */
    #main-window[titlepreface*="[S]"] .tabbrowser-tab {
      visibility: collapse;
    }

    #main-window[titlepreface*="[S]"] .titlebar-button {
      height: 40px;
    }

    #main-window[titlepreface*="[S]"] #nav-bar {
      margin-top: -37px;
    }
    #main-window[titlepreface*="[S]"][tabsintitlebar="true"] #nav-bar {
      margin-right: 137px;
    }
    #main-window[titlepreface*="[S]"] #titlebar-spacer {
      background-color: var(--chrome-secondary-background-color);
    }

    #main-window[titlepreface*="[S]"] #titlebar-buttonbox-container {
      background-color: var(--chrome-secondary-background-color);
    }

    #main-window[titlepreface*="[S]"] .titlebar-color {
      background-color: var(--toolbar-bgcolor);
    }

    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] #sidebar-header {
      visibility: collapse;
    }

    /* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/autohide_sidebar.css made available under Mozilla Public License v. 2.0
    See the above repository for updates as well as full license text. */

    /* Show sidebar only when the cursor is over it  */
    /* The border controlling sidebar width will be removed so you'll need to modify these values to change width */

    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] {
      --uc-sidebar-width: 47px;
      --uc-sidebar-hover-width: 232px;
      --uc-autohide-sidebar-delay: 0ms; /* Wait 0.6s before hiding sidebar */
      position: relative;
      min-width: var(--uc-sidebar-width) !important;
      width: var(--uc-sidebar-width) !important;
      max-width: var(--uc-sidebar-width) !important;
      z-index:1;
      margin-top: -1px;
    }

    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"][positionend] {
      direction: rtl;
    }
    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"][positionend] > *{
      direction: ltr;
    }

    #sidebar-box[positionend]:-moz-locale-dir(rtl){
      direction: ltr;
    }
    #sidebar-box[positionend]:-moz-locale-dir(rtl) > *{
      direction: rtl;
    }

    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] > #sidebar {
      transition: min-width 115ms linear !important;
      min-width: var(--uc-sidebar-width) !important;
      will-change: min-width;
    }

    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]:hover > #sidebar {
      min-width: var(--uc-sidebar-hover-width) !important;
      transition: min-width 100ms linear var(--uc-autohide-sidebar-delay), box-shadow 500ms linear !important;
      box-shadow: 0 0 4px rgba(10,10,10, .5);
      clip-path: inset(0px -15px 0px -15px);
    }

    /* Add sidebar divider and give it background */

    #sidebar,
    #sidebar-header {
      background-color: var(--toolbar-bgcolor) !important;
      border-inline: 1px solid var(--chrome-content-separator-color);
      border-inline-width: 0px 1px;
    }

    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]:not([positionend]) > :-moz-locale-dir(rtl),
    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"][positionend] > * {
      border-inline-width: 1px 0px;
    }

    /* Move statuspanel to the other side when sidebar is hovered so it doesn't get covered by sidebar */

    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]:not([positionend]):hover ~ #appcontent #statuspanel {
      inset-inline: auto 0px !important;
    }
    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]:not([positionend]):hover ~ #appcontent #statuspanel-label {
      margin-inline: 0px !important;
      border-left-style: solid !important;
    }

    /* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/autohide_bookmarks_toolbar.css made available under Mozilla Public License v. 2.0
    See the above repository for updates as well as full license text. */

    #PersonalToolbar{
      --uc-bm-height: 20px; /* Might need to adjust if the toolbar has other buttons */
      --uc-bm-padding: 7px; /* Vertical padding to be applied to bookmarks */
      --uc-autohide-toolbar-delay: 600ms; /* The toolbar is hidden after 0.6s */

      /* 0deg = "show" ; 90deg = "hide" ;  Set the following to control when bookmarks are shown */
      --uc-autohide-toolbar-focus-rotation: 0deg; /* urlbar is focused */
      --uc-autohide-toolbar-hover-rotation: 0deg; /* cursor is over the toolbar area */
    }

    :root[uidensity="compact"] #PersonalToolbar{ --uc-bm-padding: 1px; }
    :root[uidensity="touch"] #PersonalToolbar{ --uc-bm-padding: 7px }

    #PersonalToolbar:not([customizing]){
      position: relative;
      margin-bottom: calc(0px - var(--uc-bm-height) - 2 * var(--uc-bm-padding));
      transform: rotateX(90deg);
      transform-origin: top;
      transition: transform 135ms linear var(--uc-autohide-toolbar-delay) !important;
      z-index: 1;
      /* The following properties should allow the themes with trasparent toolbars to work */
      background-color: transparent !important;
      background-repeat: no-repeat,no-repeat,var(--lwt-background-tiling);
      --uc-bg-y: calc(-2 * (var(--tab-block-margin) + var(--toolbarbutton-inner-padding) + var(--toolbarbutton-outer-padding)) - var(--tab-min-height) - 16px - var(--bookmark-block-padding));
      background-position: top left,top left,var(--lwt-background-alignment,top left);
      background-position-y:top,top,var(--uc-bg-y),var(--uc-bg-y),var(--uc-bg-y);
      background-image: var(--toolbar-bgimage), linear-gradient(var(--toolbar-bgcolor),var(--toolbar-bgcolor)),var(--lwt-header-image,var(--lwt-additional-images)) !important;
    }

    #PlacesToolbarItems > .bookmark-item,
    #OtherBookmarks,
    #PersonalToolbar > #import-button{
      padding-block: var(--uc-bm-padding) !important;
    }

    #nav-bar:focus-within + #PersonalToolbar{
      transition-delay: 100ms !important;
      transform: rotateX(var(--uc-autohide-toolbar-focus-rotation,0));
    }

    #navigator-toolbox:hover > #PersonalToolbar{
      transition-delay: 100ms !important;
      transform: rotateX(var(--uc-autohide-toolbar-hover-rotation,0));
    }

    #navigator-toolbox:hover > #nav-bar:focus-within + #PersonalToolbar {
      transform: rotateX(0);
    }

    /* Uncomment to enable compatibility for multi-row_bookmarks.css */
    /* This would break buttons placed in the toolbar but that is likely not happening if you are using multi-row setup  */
    /*
    #PersonalToolbar:not([customizing]){
      position: fixed;
      display: block;
      margin-bottom: 0px !important;
    }
    */
  '';
}
