# https://github.com/nix-community/nixvim/blob/main/plugins/by-name/copilot-lua/default.nix
{
  plugins.copilot-lua = {
    enable = true;
    settings = {
      panel = {
        enabled = false;
      };
      suggestion = {
        # Use copilot suggestions, avante's suggestions using copilot are buggy
        enabled = true;
        auto_trigger = true;
        hide_during_completion = false;
        keymap = {
          accept = "<A-CR>";
        };
      };
    };
  };

  autoGroups = {
    copilot_control = {};
  };

  autoCmd = [
    {
      group = "copilot_control";
      event = ["VimEnter"];
      pattern = "*";
      callback = {
        __raw = ''
          function()
            if not vim.g.COPILOT_ENABLED then
              vim.cmd("Copilot disable")
              print("Copilot disabled on startup")
            end
          end
        '';
      };
    }
  ];

  extraConfigLua = ''
    -- CopilotEnable: enable Copilot suggestions globally
    vim.api.nvim_create_user_command("CopilotEnable", function()
      vim.g.COPILOT_ENABLED = true
      vim.cmd("Copilot enable")
      vim.notify("Copilot enabled globally", vim.log.levels.INFO)
    end, {
      desc = "Enable Copilot suggestions globally",
    })

    -- CopilotDisable: disable Copilot suggestions globally
    vim.api.nvim_create_user_command("CopilotDisable", function()
      vim.g.COPILOT_ENABLED = false
      vim.cmd("Copilot disable")
      vim.notify("Copilot disabled globally", vim.log.levels.INFO)
    end, {
      desc = "Disable Copilot suggestions globally",
    })

    -- CopilotToggle: flip Copilot state globally
    vim.api.nvim_create_user_command("CopilotToggle", function()
      if vim.g.COPILOT_ENABLED then
        vim.g.copilot_enabled = false
        vim.cmd("Copilot disable")
        vim.notify("Copilot disabled globally", vim.log.levels.INFO)
      else
        vim.g.cOPILOT_ENABLED = true
        vim.cmd("Copilot enable")
        vim.notify("Copilot enabled globally", vim.log.levels.INFO)
      end
    end, {
      desc = "Toggle Copilot suggestions globally",
    })
  '';
}
