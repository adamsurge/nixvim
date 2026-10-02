{
  plugins.snacks.settings.words = {
    enabled = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "]]";
      action = "<cmd>lua Snacks.words.jump(vim.v.count1)<CR>";
      options = {desc = "Next Reference";};
    }
    {
      mode = "n";
      key = "[[";
      action = "<cmd>lua Snacks.words.jump(-vim.v.count1)<CR>";
      options = {desc = "Previous Reference";};
    }
  ];
}
