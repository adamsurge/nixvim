{
  plugins.gitsigns = {
    enable = true;
    settings = {
      trouble = true;
      signs = {
        add = {
          text = " ";
        };
        change = {
          text = " ";
        };
        delete = {
          text = " ";
        };
        untracked = {
          text = "";
        };
        topdelete = {
          text = "󱂥 ";
        };
        changedelete = {
          text = "󱂧 ";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gh";
      action = "";
      options.desc = "+hunks";
    }
    {
      mode = "n";
      key = "]h";
      action.__raw = ''
        function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            require("gitsigns").nav_hunk("next")
          end)
          return "<Ignore>"
        end
      '';
      options = {
        desc = "Next Hunk";
        expr = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "[h";
      action.__raw = ''
        function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            require("gitsigns").nav_hunk("prev")
          end)
          return "<Ignore>"
        end
      '';
      options = {
        desc = "Previous Hunk";
        expr = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "]H";
      action.__raw = ''function() require("gitsigns").nav_hunk("last") end'';
      options.desc = "Last Hunk";
    }
    {
      mode = "n";
      key = "[H";
      action.__raw = ''function() require("gitsigns").nav_hunk("first") end'';
      options.desc = "First Hunk";
    }
    {
      mode = "n";
      key = "<leader>ghs";
      action.__raw = ''function() require("gitsigns").stage_hunk() end'';
      options.desc = "Stage Hunk";
    }
    {
      mode = "x";
      key = "<leader>ghs";
      action.__raw = ''function() require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end'';
      options.desc = "Stage Hunk";
    }
    {
      mode = "n";
      key = "<leader>ghr";
      action.__raw = ''function() require("gitsigns").reset_hunk() end'';
      options.desc = "Reset Hunk";
    }
    {
      mode = "x";
      key = "<leader>ghr";
      action.__raw = ''function() require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end'';
      options.desc = "Reset Hunk";
    }
    {
      mode = "n";
      key = "<leader>ghS";
      action.__raw = ''function() require("gitsigns").stage_buffer() end'';
      options.desc = "Stage Buffer";
    }
    {
      mode = "n";
      key = "<leader>ghu";
      action.__raw = ''function() require("gitsigns").undo_stage_hunk() end'';
      options.desc = "Undo Stage Hunk";
    }
    {
      mode = "n";
      key = "<leader>ghR";
      action.__raw = ''function() require("gitsigns").reset_buffer() end'';
      options.desc = "Reset Buffer";
    }
    {
      mode = "n";
      key = "<leader>ghp";
      action.__raw = ''function() require("gitsigns").preview_hunk() end'';
      options.desc = "Preview Hunk";
    }
    {
      mode = "n";
      key = "<leader>ghb";
      action.__raw = ''function() require("gitsigns").blame_line() end'';
      options.desc = "Blame Line";
    }
    {
      mode = "n";
      key = "<leader>ghB";
      action.__raw = ''function() require("gitsigns").blame_line({ full = true }) end'';
      options.desc = "Blame Line (full)";
    }
    {
      mode = "n";
      key = "<leader>ghd";
      action.__raw = ''function() require("gitsigns").diffthis() end'';
      options.desc = "Diff This";
    }
    {
      mode = "n";
      key = "<leader>ghD";
      action.__raw = ''function() require("gitsigns").diffthis("~") end'';
      options.desc = "Diff This ~";
    }
    {
      mode = ["o" "x"];
      key = "ih";
      action.__raw = ''function() require("gitsigns").select_hunk() end'';
      options.desc = "Git Hunk";
    }
  ];
}
