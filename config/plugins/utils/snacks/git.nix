{pkgs, ...}: {
  extraPackages = with pkgs; [
    gh
  ];

  plugins.snacks.settings = {
    lazygit = {
      enabled = true;
    };
    git = {
      enabled = true;
    };
    github = {
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
    # GitHub CLI keymaps
    {
      mode = "n";
      key = "<leader>gh";
      action = "";
      options = {
        desc = "GitHub";
      };
    }
    {
      mode = "n";
      key = "<leader>ghi";
      action = "<cmd>lua Snacks.terminal('gh issue list')<CR>";
      options = {desc = "GitHub Issues";};
    }
    {
      mode = "n";
      key = "<leader>ghp";
      action = "<cmd>lua Snacks.terminal('gh pr list')<CR>";
      options = {desc = "GitHub Pull Requests";};
    }
    {
      mode = "n";
      key = "<leader>ghr";
      action = "<cmd>lua Snacks.terminal('gh repo list')<CR>";
      options = {desc = "GitHub Repos";};
    }
  ];
}
