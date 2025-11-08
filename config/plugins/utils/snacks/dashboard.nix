{
  plugins.snacks.settings.dashboard = {
    enabled = true;
    preset = {
      header = ''
         ██████   █████ █████ █████ █████ █████   █████ █████ ██████   ██████
        ░░██████ ░░███ ░░███ ░░███ ░░███ ░░███   ░░███ ░░███ ░░██████ ██████
         ░███░███ ░███  ░███  ░░███ ███   ░███    ░███  ░███  ░███░█████░███
         ░███░░███░███  ░███   ░░█████    ░███    ░███  ░███  ░███░░███ ░███
         ░███ ░░██████  ░███    ███░███   ░░███   ███   ░███  ░███ ░░░  ░███
         ░███  ░░█████  ░███   ███ ░░███   ░░░█████░    ░███  ░███      ░███
         █████  ░░█████ █████ █████ █████    ░░███      █████ █████     █████
        ░░░░░    ░░░░░ ░░░░░ ░░░░░ ░░░░░      ░░░      ░░░░░ ░░░░░     ░░░░░
      '';
      keys = [
        {
          icon = " ";
          key = "f";
          desc = "Find File";
          action = "<cmd>lua Snacks.dashboard.pick('files')<CR>";
        }
        {
          icon = " ";
          key = "n";
          desc = "New File";
          action = "<cmd>ene | startinsert<CR>";
        }
        {
          icon = " ";
          key = "g";
          desc = "Find Text";
          action = "<cmd>lua Snacks.dashboard.pick('live_grep')<CR>";
        }
        {
          icon = " ";
          key = "r";
          desc = "Recent Files";
          action = "<cmd>lua Snacks.dashboard.pick('oldfiles')<CR>";
        }
        {
          icon = " ";
          key = "q";
          desc = "Quit";
          action = "<cmd>qa<CR>";
        }
      ];
    };
    sections = [
      {section = "header";}
      {
        icon = " ";
        title = "Keymaps";
        section = "keys";
        indent = 2;
        padding = 1;
      }
      {
        icon = " ";
        title = "Recent Files";
        section = "recent_files";
        indent = 2;
        padding = 1;
      }
      {
        icon = " ";
        title = "Projects";
        section = "projects";
        indent = 2;
        padding = 1;
      }
      {
        icon = " ";
        title = "Git Status";
        section = "terminal";
        enabled = "function() return Snacks.git.get_root() ~= nil end";
        cmd = "git status --short --branch --renames";
        height = 5;
        padding = 1;
        ttl = 300;
        indent = 3;
      }
    ];
  };
}
