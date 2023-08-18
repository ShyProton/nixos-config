{
  programs.nixvim.options = {
    number = true;
    relativenumber = true;
    numberwidth = 4;
    signcolumn = "yes:2";
    colorcolumn = "80";
    synmaxcol = 1024;
    cursorline = true;

    scrolloff = 8;
    sidescrolloff = 8;
    wrap = false;

    smartindent = true;
    autoindent = true;

    splitbelow = true;
    splitright = true;

    shiftwidth = 4;
    tabstop = 4;
    softtabstop = 4;
    showtabline = 4;
    expandtab = true;

    hlsearch = true;
    ignorecase = true;
    smartcase = true;

    timeout = true;
    timeoutlen = 500;
    updatetime = 300;
    ttimeoutlen = 10;

    backup = false;
    swapfile = false;

    clipboard = "unnamedplus";
    mouse = "a";

    showmode = false;
    pumheight = 10;
    termguicolors = true;
  };
}
