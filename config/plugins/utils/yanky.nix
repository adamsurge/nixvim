{
  plugins.yanky = {
    enable = true;
    settings = {
      ring = {
        history_length = 1000;
        storage = "shada";
        sync_with_numbered_registers = true;
        cancel_event = "update";
      };
      system_clipboard = {
        sync_with_ring = true;
      };
      highlight = {
        on_put = true;
        on_yank = true;
        timer = 200;
      };
      preserve_cursor_position = {
        enabled = true;
      };
      textobj = {
        enabled = true;
      };
    };
  };

  # Create custom yanky picker with preview and colors
  extraConfigLua = ''
    local function yanky_picker_with_preview()
      local history = require("yanky.history")
      local items = {}
      local current_ft = vim.bo.filetype  -- Get current buffer filetype

      for idx, entry in ipairs(history.all()) do
        local display_text = entry.regcontents:gsub("\n", " "):sub(1, 80)
        table.insert(items, {
          text = string.format("%d %s", idx, display_text),
          idx = idx,
          preview = {
            text = entry.regcontents,
            ft = current_ft ~= "" and current_ft or "text",  -- Use current filetype or default to text
          },
          regcontents = entry.regcontents,
          regtype = entry.regtype,
        })
      end

      Snacks.picker.pick({
        source = "yank_history",
        items = items,
        format = function(item)
          local ret = {}
          ret[#ret + 1] = { tostring(item.idx) .. ". ", "Number" }
          ret[#ret + 1] = { item.text:sub(#tostring(item.idx) + 2) }
          return ret
        end,
        preview = "preview",
        confirm = function(picker, item)
          picker:close()
          vim.fn.setreg('"', item.regcontents, item.regtype)
          vim.cmd('normal! ""p')
        end,
      })
    end

    vim.keymap.set("n", "<leader>p", yanky_picker_with_preview, { desc = "Open Yank History" })
  '';

  keymaps = [
    # {
    #   mode = "n";
    #   key = "<leader>p";
    #   action = "<cmd>YankyRingHistory<CR>";
    #   options = {desc = "Open Yank History";};
    # }
    {
      mode = "n";
      key = "y";
      action = "<Plug>(YankyYank)";
      options = {desc = "Yank";};
    }
    {
      mode = "x";
      key = "y";
      action = "<Plug>(YankyYank)";
      options = {desc = "Yank";};
    }
    {
      mode = "n";
      key = "p";
      action = "<Plug>(YankyPutAfter)";
      options = {desc = "Put after";};
    }
    {
      mode = "n";
      key = "P";
      action = "<Plug>(YankyPutBefore)";
      options = {desc = "Put before";};
    }
    {
      mode = "x";
      key = "p";
      action = "<Plug>(YankyPutAfter)";
      options = {desc = "Put after";};
    }
    {
      mode = "x";
      key = "P";
      action = "<Plug>(YankyPutBefore)";
      options = {desc = "Put before";};
    }
    {
      mode = "n";
      key = "<c-p>";
      action = "<Plug>(YankyPreviousEntry)";
      options = {desc = "Previous yank entry";};
    }
    {
      mode = "n";
      key = "<c-n>";
      action = "<Plug>(YankyNextEntry)";
      options = {desc = "Next yank entry";};
    }
  ];
}
