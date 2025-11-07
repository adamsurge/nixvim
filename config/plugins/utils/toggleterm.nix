{
  plugins.toggleterm = {
    enable = true;
    settings = {
      size = 20;
    };
  };
  keymaps = [
    # Terminal keymap grouping
    {
      mode = "n";
      key = "<leader>t";
      action = "";
      options = {
        desc = "terminal";
      };
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<cr>";
      options = {
        desc = "Toggle Terminal Window";
      };
    }
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>ToggleTerm direction=vertical<cr>";
      options = {
        desc = "Vertical Terminal Window";
      };
    }
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>ToggleTerm direction=horizontal<cr>";
      options = {
        desc = "Horizontal Terminal Window";
      };
    }
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>ToggleTerm direction=float<cr>";
      options = {
        desc = "Floating Terminal Window";
      };
    }
  ];
}
