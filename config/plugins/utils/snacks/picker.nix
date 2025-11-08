{
  plugins.snacks.settings.picker = {
    enabled = true;
    layout = {
      preset = "default";
      cycle = false;
    };
    matcher = {
      frecency = true;
    };
    sort = {
      fields = ["score:desc" "idx"];
    };
    ui_select = true;
    formatters = {
      file = {
        filename_first = true;
      };
    };
    sources = {
      files = {
        hidden = true;
      };
      grep = {
        hidden = true;
      };
      explorer = {
        layout = {
          preset = "sidebar";
          preview = true;
        };
      };
    };
    win = {
      input = {
        keys = {
          "<Esc>" = "close";
          "<C-c>" = "close";
          "<CR>" = "confirm";
          "<Up>" = "list_up";
          "<Down>" = "list_down";
          "<C-p>" = "list_up";
          "<C-n>" = "list_down";
          "<C-u>" = "preview_scroll_up";
          "<C-d>" = "preview_scroll_down";
          "<C-b>" = "list_scroll_up";
          "<C-f>" = "list_scroll_down";
          "<Tab>" = "select_and_next";
          "<S-Tab>" = "select_and_prev";
          "<C-q>" = "qflist";
          "<C-a>" = "select_all";
          "<C-/>".__raw = "function() vim.cmd('stopinsert') end";
          "<C-_>".__raw = "function() vim.cmd('stopinsert') end";
        };
      };
    };
  };
  keymaps = [
    # Find keymap grouping
    {
      mode = "n";
      key = "<leader>f";
      action = "";
      options = {
        desc = "find";
      };
    }
    # Search keymap grouping
    {
      mode = "n";
      key = "<leader>s";
      action = "";
      options = {
        desc = "search";
      };
    }
    # Snacks Picker keymaps (migrated from telescope)
    {
      mode = "n";
      key = "<leader><space>";
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options = {desc = "Find project files";};
    }
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options = {desc = "Grep (root dir)";};
    }
    {
      mode = "n";
      key = "<leader>:";
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
      options = {desc = "Command History";};
    }
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options = {desc = "+buffer";};
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options = {desc = "Find project files";};
    }
    {
      mode = "n";
      key = "<leader>ft";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options = {desc = "Find text";};
    }
    {
      mode = "n";
      key = "<leader>fR";
      action = "<cmd>lua Snacks.picker.resume()<CR>";
      options = {desc = "Resume";};
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>lua Snacks.picker.recent()<CR>";
      options = {desc = "Recent";};
    }
    {
      mode = "n";
      key = "<C-p>";
      action = "<cmd>lua Snacks.picker.git_files()<CR>";
      options = {desc = "Search git files";};
    }
    {
      mode = "n";
      key = "<leader>gl";
      action = "<cmd>lua Snacks.picker.git_log()<CR>";
      options = {desc = "Commits";};
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>lua Snacks.picker.git_status()<CR>";
      options = {desc = "Status";};
    }
    {
      mode = "n";
      key = "<leader>sa";
      action = "<cmd>lua Snacks.picker.autocmds()<CR>";
      options = {desc = "Auto Commands";};
    }
    {
      mode = "n";
      key = "<leader>sb";
      action = "<cmd>lua Snacks.picker.lines()<CR>";
      options = {desc = "Buffer";};
    }
    {
      mode = "n";
      key = "<leader>sc";
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
      options = {desc = "Command History";};
    }
    {
      mode = "n";
      key = "<leader>sC";
      action = "<cmd>lua Snacks.picker.commands()<CR>";
      options = {desc = "Commands";};
    }
    {
      mode = "n";
      key = "<leader>sD";
      action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
      options = {desc = "Workspace diagnostics";};
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<cmd>lua Snacks.picker.help()<CR>";
      options = {desc = "Help pages";};
    }
    {
      mode = "n";
      key = "<leader>sH";
      action = "<cmd>lua Snacks.picker.highlights()<CR>";
      options = {desc = "Search Highlight Groups";};
    }
    {
      mode = "n";
      key = "<leader>sk";
      action = "<cmd>lua Snacks.picker.keymaps()<CR>";
      options = {desc = "Keymaps";};
    }
    {
      mode = "n";
      key = "<leader>sM";
      action = "<cmd>lua Snacks.picker.man()<CR>";
      options = {desc = "Man pages";};
    }
    {
      mode = "n";
      key = "<leader>sm";
      action = "<cmd>lua Snacks.picker.marks()<CR>";
      options = {desc = "Jump to Mark";};
    }
    {
      mode = "n";
      key = "<leader>sR";
      action = "<cmd>lua Snacks.picker.resume()<CR>";
      options = {desc = "Resume";};
    }
    {
      mode = "n";
      key = "<leader>uC";
      action = "<cmd>lua Snacks.picker.colorschemes()<CR>";
      options = {desc = "Colorscheme preview";};
    }
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>";
      options = {desc = "Document diagnostics";};
    }
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd>lua Snacks.picker.explorer()<CR>";
      options = {desc = "File browser";};
    }
    {
      mode = "n";
      key = "<leader>fE";
      action = "<cmd>lua Snacks.picker.explorer({cwd = vim.fn.expand('%:p:h')})<CR>";
      options = {desc = "File browser";};
    }
  ];
}
