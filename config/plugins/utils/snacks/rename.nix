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
    local events = require("neo-tree.events")
    require("neo-tree").setup({
      event_handlers = {
        {
          event = events.FILE_MOVED,
          handler = function(data)
            Snacks.rename.on_rename_file(data.source, data.destination)
          end,
        },
        {
          event = events.FILE_RENAMED,
          handler = function(data)
            Snacks.rename.on_rename_file(data.source, data.destination)
          end,
        },
      },
    })
  '';
}
