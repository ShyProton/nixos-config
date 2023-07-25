{
  programs.nixvim.plugins.dashboard = {
    enable = true;
    hideStatusline = true;
    hideTabline = true;
    header = ["YAAARRRGHHHH!!"];
    center = [
      {
        icon = "a";
        desc = "Do a thing";
        action = "lua print(2)";
      }
    ];
  };
}
