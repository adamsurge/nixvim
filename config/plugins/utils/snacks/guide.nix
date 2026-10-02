{
  extraConfigLua = ''
    local guide_entries = {
      {
        label = "Find files",
        detail = "<leader><space> or <leader>ff",
        action = function() Snacks.picker.files() end,
      },
      {
        label = "Browse project files",
        detail = "<leader>e or <leader>fe",
        action = function() Snacks.picker.explorer() end,
      },
      {
        label = "Edit parent directory",
        detail = "<leader>oo",
        action = function() vim.cmd.Oil() end,
      },
      {
        label = "Search and replace",
        detail = "<leader>sr",
        action = function()
          require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
        end,
      },
      {
        label = "Browse undo history",
        detail = "<leader>su",
        action = function() Snacks.picker.undo() end,
      },
      {
        label = "Open quickfix list",
        detail = "<leader>co",
      },
      {
        label = "Open location list",
        detail = "<leader>cl",
      },
      {
        label = "Open Git UI",
        detail = "<leader>gg",
        action = function() Snacks.lazygit() end,
      },
      {
        label = "Run tests",
        detail = "<leader>Tr, <leader>Tf, <leader>Ta (Neotest)",
      },
      {
        label = "Debug",
        detail = "DAP mappings via <leader>d",
      },
      {
        label = "Manage sessions",
        detail = "<leader>qs, <leader>ql, <leader>qd",
      },
      {
        label = "Open code outline",
        detail = "<leader>uo",
        action = function() vim.cmd("AerialToggle!") end,
      },
      {
        label = "Search all keymaps",
        detail = "<leader>sk",
        action = function() Snacks.picker.keymaps() end,
      },
    }

    vim.api.nvim_create_user_command("PluginGuide", function()
      vim.ui.select(guide_entries, {
        prompt = "Workflow guide",
        format_item = function(entry)
          return entry.label .. " — " .. entry.detail
        end,
      }, function(entry)
        if entry and entry.action then
          entry.action()
        end
      end)
    end, { desc = "Open workflow guide" })
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>?";
      action = "<cmd>PluginGuide<cr>";
      options = {desc = "Workflow Guide";};
    }
  ];
}
