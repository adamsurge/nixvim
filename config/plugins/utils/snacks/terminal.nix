let
  terminalEnv = ''{ NOZELLIJ = "1" }'';
  floatConfig = ''
    {
      position = "float",
      border = "rounded",
      wo = { winbar = "" },
      width = 0.9,
      height = 0.9
    }
  '';
in {
  plugins.snacks.settings.terminal = {
    enabled = true;
  };

  keymaps = [
    # Terminal keymap grouping (which-key label)
    {
      mode = "n";
      key = "<leader>t";
      action = "";
      options = {
        desc = "+terminal";
      };
    }

    # Toggle terminal (default float)
    {
      mode = "n";
      key = "<leader>tt";
      action.__raw = ''
        function()
          Snacks.terminal(nil, { win = ${floatConfig}, env = ${terminalEnv} })
        end
      '';
      options = {
        desc = "Toggle Terminal";
      };
    }

    # Terminal in a new Neovim tab
    {
      mode = "n";
      key = "<leader>tn";
      action.__raw = ''
        function()
          vim.cmd.tabnew()
          vim.wo.winbar = ""
          vim.fn.termopen(vim.o.shell, { env = ${terminalEnv} })
          vim.cmd.startinsert()
        end
      '';
      options = {
        desc = "Terminal (new tab)";
      };
    }

    # Switch tabs without leaving terminal job mode
    {
      mode = "t";
      key = "<S-h>";
      action = "<C-\\><C-n><cmd>tabprevious<cr>";
      options = {
        desc = "Previous Tab";
      };
    }
    {
      mode = "t";
      key = "<S-l>";
      action = "<C-\\><C-n><cmd>tabnext<cr>";
      options = {
        desc = "Next Tab";
      };
    }

    # Vertical split terminal
    {
      mode = "n";
      key = "<leader>tv";
      action.__raw = ''
        function()
          Snacks.terminal(nil, { win = { position = "right", wo = { winbar = "" } }, env = ${terminalEnv} })
        end
      '';
      options = {
        desc = "Terminal (vertical split)";
      };
    }

    # Horizontal split terminal
    {
      mode = "n";
      key = "<leader>th";
      action.__raw = ''
        function()
          Snacks.terminal(nil, { win = { position = "bottom", wo = { winbar = "" } }, env = ${terminalEnv} })
        end
      '';
      options = {
        desc = "Terminal (horizontal split)";
      };
    }

    # Floating terminal
    {
      mode = "n";
      key = "<leader>tf";
      action.__raw = ''
        function()
          Snacks.terminal(nil, { win = ${floatConfig}, env = ${terminalEnv} })
        end
      '';
      options = {
        desc = "Terminal (float)";
      };
    }
  ];
}
