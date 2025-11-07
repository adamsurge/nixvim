{lib, ...}: {
  plugins.snacks = {
    enable = true;
    settings = {
      input.enabled = true;
      picker = {
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
      bufdelete = {
        enabled = true;
      };
      bigfile = {
        enabled = true;
        notify = true;
        size = 1.5 * 1024 * 1024; # 1.5MB
        line_length = 1000;
        setup = lib.nixvim.mkRaw ''
          function(ctx)
            -- Disable treesitter
            pcall(vim.treesitter.stop, ctx.buf)

            -- Detach LSP clients
            for _, client in ipairs(vim.lsp.get_clients({bufnr = ctx.buf})) do
              vim.lsp.buf_detach_client(ctx.buf, client.id)
            end

            -- Disable vim-illuminate (buffer-local)
            pcall(function()
              require('illuminate').pause_buf(ctx.buf)
            end)

            -- Disable indent-blankline (buffer-local)
            pcall(function()
              require('ibl').setup_buffer(ctx.buf, { enabled = false })
            end)

            -- Disable gitsigns (detach from buffer)
            pcall(function()
              require('gitsigns').detach(ctx.buf)
            end)

            -- Disable colorizer (if nvim-colorizer.lua)
            pcall(function()
              require('colorizer').detach_from_buffer(ctx.buf)
            end)

            -- Disable nvim-navic - Set the lazy update flag to minimize performance impact
            vim.b[ctx.buf].navic_lazy_update_context = true

            -- Disable matchparen if available
            if vim.fn.exists(":NoMatchParen") ~= 0 then
              vim.cmd([[NoMatchParen]])
            end

            -- Set basic options for performance
            Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })

            -- Re-enable basic syntax highlighting
            vim.schedule(function()
              if vim.api.nvim_buf_is_valid(ctx.buf) then
                vim.bo[ctx.buf].syntax = ctx.ft
              end
            end)
          end
        '';
      };
      dashboard = {
        enabled = true;
        preset = {
          header = ''
             ██████   █████ █████ █████ █████ █████   █████ █████ ██████   ██████
            ░░██████ ░░███ ░░███ ░░███ ░░███ ░░███   ░░███ ░░███ ░░██████ ██████
             ░███░███ ░███  ░███  ░░███ ███   ░███    ░███  ░███  ░███░█████░███
             ░███░░███░███  ░███   ░░█████    ░███    ░███  ░███  ░███░░███ ░███
             ░███ ░░██████  ░███    ███░███   ░░███   ███   ░███  ░███ ░░░  ░███
             ░███  ░░█████  ░███   ███ ░░███   ░░░█████░    ░███  ░███      ░███
             █████  ░░█████ █████ █████ █████    ░░███      █████ █████     █████
            ░░░░░    ░░░░░ ░░░░░ ░░░░░ ░░░░░      ░░░      ░░░░░ ░░░░░     ░░░░░
          '';
          keys = [
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action = "<cmd>lua Snacks.dashboard.pick('files')<CR>";
            }
            {
              icon = " ";
              key = "n";
              desc = "New File";
              action = "<cmd>ene | startinsert<CR>";
            }
            {
              icon = " ";
              key = "g";
              desc = "Find Text";
              action = "<cmd>lua Snacks.dashboard.pick('live_grep')<CR>";
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = "<cmd>lua Snacks.dashboard.pick('oldfiles')<CR>";
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = "<cmd>qa<CR>";
            }
          ];
        };
        sections = [
          {section = "header";}
          {
            icon = " ";
            title = "Keymaps";
            section = "keys";
            indent = 2;
            padding = 1;
          }
          {
            icon = " ";
            title = "Recent Files";
            section = "recent_files";
            indent = 2;
            padding = 1;
          }
          {
            icon = " ";
            title = "Projects";
            section = "projects";
            indent = 2;
            padding = 1;
          }
          {
            icon = " ";
            title = "Git Status";
            section = "terminal";
            enabled = "function() return Snacks.git.get_root() ~= nil end";
            cmd = "git status --short --branch --renames";
            height = 5;
            padding = 1;
            ttl = 300;
            indent = 3;
          }
        ];
      };
      lazygit.enabled = true;
      rename.enabled = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>lua Snacks.bufdelete()<CR>";
      options = {desc = "Delete Buffer";};
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>lua Snacks.bufdelete()<CR>";
      options = {desc = "Delete Buffer";};
    }
    {
      mode = "n";
      key = "<leader>bD";
      action = "<cmd>lua Snacks.bufdelete({ force = true })<CR>";
      options = {desc = "Delete Buffer (Force)";};
    }
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>lua Snacks.bufdelete.other()<CR>";
      options = {desc = "Delete Other Buffers";};
    }
    {
      mode = "n";
      key = "<leader>ba";
      action = "<cmd>lua Snacks.bufdelete.all()<CR>";
      options = {desc = "Delete All Buffers";};
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
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>lua Snacks.lazygit()<CR>";
      options = {desc = "Lazygit";};
    }
  ];

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
