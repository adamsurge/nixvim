{lib, ...}: {
  plugins.snacks.settings.bigfile = {
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
}
