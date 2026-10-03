{
  plugins.trouble.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>D";
      action = "";
      options.desc = "diagnostics";
    }
    {
      mode = "n";
      key = "<leader>Dt";
      action = "<cmd>Trouble diagnostics toggle<CR>";
      options.desc = "Toggle diagnostics";
    }
    {
      mode = "n";
      key = "<leader>Db";
      action = "<cmd>Trouble diagnostics buffer toggle<CR>";
      options.desc = "Toggle buffer diagnostics";
    }
  ];
}
