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
            _G._copilot_load_state()
            if not vim.g.COPILOT_ENABLED then
              vim.cmd("Copilot disable")
            end
          end
        '';
      };
    }
  ];

  extraConfigLua = ''
    local state_file = vim.fn.stdpath("state") .. "/copilot_enabled"

    local function write_state(enabled)
      local fd = io.open(state_file, "w")
      if fd then
        fd:write(enabled and "1" or "0")
        fd:close()
      end
    end

    _G._copilot_load_state = function()
      local fd = io.open(state_file, "r")
      if not fd then
        vim.g.COPILOT_ENABLED = false
        return
      end
      local contents = fd:read("*a") or ""
      fd:close()
      vim.g.COPILOT_ENABLED = contents:match("^1") ~= nil
    end

    vim.api.nvim_create_user_command("CopilotEnable", function()
      vim.g.COPILOT_ENABLED = true
      write_state(true)
      vim.cmd("Copilot enable")
      vim.notify("Copilot enabled globally", vim.log.levels.INFO)
    end, {desc = "Enable Copilot suggestions globally"})

    vim.api.nvim_create_user_command("CopilotDisable", function()
      vim.g.COPILOT_ENABLED = false
      write_state(false)
      vim.cmd("Copilot disable")
      vim.notify("Copilot disabled globally", vim.log.levels.INFO)
    end, {desc = "Disable Copilot suggestions globally"})

    vim.api.nvim_create_user_command("CopilotToggle", function()
      if vim.g.COPILOT_ENABLED then
        vim.cmd("CopilotDisable")
      else
        vim.cmd("CopilotEnable")
      end
    end, {desc = "Toggle Copilot suggestions globally"})
  '';
}
