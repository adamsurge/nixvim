{
  plugins.snacks.settings.rename = {
    enabled = true;
  };

  extraConfigLua = ''
    -- Integration with oil.nvim for rename functionality
    vim.api.nvim_create_autocmd("User", {
      pattern = "OilActionsPost",
      callback = function(event)
        if event.data.actions[1].type == "move" then
          Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
        end
      end,
    })

    -- Integration with neo-tree for rename functionality
    vim.schedule(function()
      local ok, events = pcall(require, "neo-tree.events")
      if not ok then return end
      local handler = function(data)
        Snacks.rename.on_rename_file(data.source, data.destination)
      end
      events.subscribe({event = events.FILE_MOVED, handler = handler})
      events.subscribe({event = events.FILE_RENAMED, handler = handler})
    end)
  '';
}
