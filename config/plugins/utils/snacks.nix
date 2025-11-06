{
  plugins.snacks = {
    enable = true;
    settings = {
      input.enabled = true;
      dashboard = {
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
              action = ":lua Snacks.dashboard.pick('files')";
            }
            {
              icon = " ";
              key = "n";
              desc = "New File";
              action = ":ene | startinsert";
            }
            {
              icon = " ";
              key = "g";
              desc = "Find Text";
              action = ":lua Snacks.dashboard.pick('live_grep')";
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = ":lua Snacks.dashboard.pick('oldfiles')";
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
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
    };
  };
}
