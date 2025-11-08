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
