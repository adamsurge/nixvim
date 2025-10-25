{
  plugins.zellij-nav = {
    enable = true;
  };

  autoCmd = [
    {
      event = ["VimLeave"];
      pattern = "*";
      command = "silent !zellij action switch-mode normal";
    }
  ];

  keymaps = [
    {
      mode = "n";
      key = "<C-h>";
      action = "<cmd>ZellijNavigateLeftTab<cr>";
      options = {
        desc = "Go to Left Window or Tab";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<cmd>ZellijNavigateDown<cr>";
      options = {
        desc = "Go to Lower Window";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<cmd>ZellijNavigateUp<cr>";
      options = {
        desc = "Go to Upper Window";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<cmd>ZellijNavigateRightTab<cr>";
      options = {
        desc = "Go to Right Window or Tab";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "<cmd>ZellijNavigateLeftTab<cr>";
      options = {
        desc = "Go to Left Window or Tab";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<cmd>ZellijNavigateDown<cr>";
      options = {
        desc = "Go to Lower Window";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Up>";
      action = "<cmd>ZellijNavigateUp<cr>";
      options = {
        desc = "Go to Upper Window";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<cmd>ZellijNavigateRightTab<cr>";
      options = {
        desc = "Go to Right Window or Tab";
        silent = true;
      };
    }
  ];
}
