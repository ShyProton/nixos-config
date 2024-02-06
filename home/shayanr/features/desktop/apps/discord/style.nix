# TODO: Make more theme-agnostic.
{palette, ...}: ''
  /*
    Set basic color variables. Some parts of Discord don't use these,
    so we need to do more after...
  */

  :root {
    --interactive-normal: #${palette.base06};
    --text-normal: #${palette.base06};
    --background-primary: #32302F;
    --background-secondary: #${palette.base01};
    --background-tertiary: #211E1D;
    --background-secondary-alt: #211E1D;
    --background-floating: #32302F;
    --channels-default: #${palette.base06};
    --deprecated-panel-background: #161818;
    --channeltextarea-background: #${palette.base00};
    --header-primary: #${palette.base06};
    --header-secondary: #c3ac96;
    --activity-card-background: #FFF;
    --scrollbar-auto-thumb: #${palette.base06};
    --scrollbar-auto-track: #${palette.base01};
    --scrollbar-thin-thumb: #${palette.base06};
    --scrollbar-thin-track: transparent;
    --background-modifier-hover: #4e4845;
    --background-modifier-active: #4e4845;
    --background-modifier-selected: #665c54;
  }

  /* Popout / menu colors. */
  .da-popouts .da-container,
  .da-friendsTableHeader,
  .da-friendsTable,
  .da-autocomplete,
  .da-themedPopout,
  .da-header,
  .da-footer,
  .da-userPopout > *,
  .da-systemPad,
  .da-autocompleteHeaderBackground,
  .popout-3gby1q,
  .contentWrapper-3vHNP2,
  .header-1ULbqO,
  .unicodeShortcut-3N8oDe {
    background-color: #${palette.base01};
    border-color: transparent !important;
  }

  .input-2m5SfJ, .list-obNEuP, .inner-1NoIT5 {
    background-color: #211E1D;
  }

  .modeSelected-3DmyhH .content-1gYQeQ, .modeSelected-3DmyhH:hover {
    background-color: #665c54 !important;
  }

  .container-ZMc96U, .inspector-DFKXwB {
  background-color: #32302F !important;
  }

  .perksModalContentWrapper-3RHugb {
    padding: 64px 0 96px;
    background: #32302F;
  }

  .scroller-1bVxF5, .scroller-18M1mG {
    background: #32302F;
  }

  .theme-dark .da-messageGroupWrapper {
    background-color: var(--background-tertiary) !important;
    border-color: transparent;
  }

  /*
    Each individual item in popouts has a slight gradient.
    We clear it here.
  */
  .theme-dark .da-option:after {
    background-image: none !important;
  }

  /* Recolor the emoji button in the chat bar to match the color scheme. */
  .headerLabel-1g790w {
    color: var(--text-normal) !important;
  }

  /* Recolor scrollbar track. */
  .da-messagesWrapper .da-scroller::-webkit-scrollbar,
  .da-messagesWrapper .da-scroller::-webkit-scrollbar-track-piece {
    background-color: var(--background-tertiary) !important;
    border-color: rgba(0,0,0,0) !important;
  }

  /* Recolor scrollbar thumbs. */
  .da-scrollerThemed .da-scroller::-webkit-scrollbar-thumb,
  .da-scrollerWrap .da-scroller::-webkit-scrollbar-thumb {
    background-color: var(--background-secondary) !important;
    border-color: var(--background-tertiary) !important;
  }

  /* Gruvbox Red */
  .hljs-deletion,
  .hljs-formula,
  .hljs-keyword,
  .hljs-link,
  .hljs-selector-tag {
    color: #${palette.base08};
  }

  /* Gruvbox Blue */
  .hljs-built_in,
  .hljs-emphasis,
  .hljs-name,
  .hljs-quote,
  .hljs-strong,
  .hljs-title,
  .hljs-variable {
    color: #${palette.base0D};
  }

  /* Gruvbox Yellow */
  .hljs-attr,
  .hljs-params,
  .hljs-template-tag,
  .hljs-type {
    color: #${palette.base0A};
  }

  /* Gruvbox Purple */
  .hljs-builtin-name,
  .hljs-doctag,
  .hljs-literal,
  .hljs-number {
    color: #${palette.base0E};
  }

  /* Gruvbox Orange */
  .hljs-code,
  .hljs-meta,
  .hljs-regexp,
  .hljs-selector-id,
  .hljs-template-variable {
    color: #${palette.base09};
  }

  /* Gruvbox Green */
  .hljs-addition,
  .hljs-meta-string,
  .hljs-section,
  .hljs-selector-attr,
  .hljs-selector-class,
  .hljs-string,
  .hljs-symbol {
    color: #${palette.base0B};
  }

  /* Gruvbox Aqua */
  .hljs-attribute,
  .hljs-bullet,
  .hljs-class,
  .hljs-function,
  .hljs-function .hljs-keyword,
  .hljs-meta-keyword,
  .hljs-selector-pseudo,
  .hljs-tag {
    color: #${palette.base0C};
  }

  /* Gruvbox Gray */
  .hljs-comment {
    color: #928374;
  }

  /* Gruvbox Purple */
  .hljs-link_label,
  .hljs-literal,
  .hljs-number {
    color: #d3869b;
  }

  .hljs-comment,
  .hljs-emphasis {
    font-style: italic;
  }

  .hljs-section,
  .hljs-strong,
  .hljs-tag {
    font-weight: bold;
  }
''
