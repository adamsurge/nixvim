{
  plugins.snacks.settings = {
    lazygit = {
      enabled = true;
    };
    git = {
      enabled = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>lua Snacks.lazygit()<CR>";
      options = {desc = "Lazygit";};
    }
    # Additional Git keymaps
    {
      mode = "n";
      key = "<leader>g";
      action = "";
      options = {
        desc = "git";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>lua Snacks.picker.git_branches()<CR>";
      options = {desc = "Git Branches";};
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>lua Snacks.picker.git_diff()<CR>";
      options = {desc = "Git Diff";};
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = "<cmd>lua Snacks.picker.git_stash()<CR>";
      options = {desc = "Git Stash";};
    }
  ];
}
