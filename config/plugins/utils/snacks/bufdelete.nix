{
  plugins.snacks.settings.bufdelete = {
    enabled = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>lua Snacks.bufdelete()<CR>";
      options = {desc = "Delete Buffer";};
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>lua Snacks.bufdelete()<CR>";
      options = {desc = "Delete Buffer";};
    }
    {
      mode = "n";
      key = "<leader>bD";
      action = "<cmd>lua Snacks.bufdelete({ force = true })<CR>";
      options = {desc = "Delete Buffer (Force)";};
    }
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>lua Snacks.bufdelete.other()<CR>";
      options = {desc = "Delete Other Buffers";};
    }
    {
      mode = "n";
      key = "<leader>ba";
      action = "<cmd>lua Snacks.bufdelete.all()<CR>";
      options = {desc = "Delete All Buffers";};
    }
  ];
}
