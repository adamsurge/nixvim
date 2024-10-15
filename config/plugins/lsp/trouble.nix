{
  plugins.trouble.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>d";
      action = "+diagnostics/debug";
    }
    {
      key = "<leader>dT";
      action = "<CMD>Trouble diagnostics toggle<CR>";
      options.desc = "Toggle trouble";
    }
  ];
}
