{
  plugins.flash = {
    enable = true;
  };

  keymaps = [
    {
      mode = ["n" "x" "o"];
      key = "s";
      action = ''<cmd>lua require("flash").jump()<CR>'';
      options = {desc = "Flash";};
    }
    {
      mode = ["n" "x" "o"];
      key = "S";
      action = ''<cmd>lua require("flash").treesitter()<CR>'';
      options = {desc = "Flash treesitter";};
    }
    {
      mode = ["n" "x" "o"];
      key = "<M-s>";
      action = ''<cmd>lua require("flash").treesitter()<CR>'';
      options = {desc = "Remote flash";};
    }
  ];
}
