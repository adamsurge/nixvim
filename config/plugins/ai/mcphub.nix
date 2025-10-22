{
  mcphub-nvim,
  mcp-hub,
  ...
}: {
  extraPlugins = [mcphub-nvim];
  # all options https://ravitemer.github.io/mcphub.nvim/configuration.html#default-configuration
  extraConfigLua =
    # lua
    ''
      require("mcphub").setup({
          config = vim.fn.expand("~/.config/mcphub/servers.json"),
          port = 37373,
          cmd = "${mcp-hub}/bin/mcp-hub",

          ---Chat-plugin related options
          auto_approve = false, -- Auto approve mcp tool calls
          auto_toggle_mcp_servers = true, -- Let LLMs start and stop MCP servers automatically
          extensions = {
              avante = {
                  make_slash_commands = true, -- make /slash commands from MCP server prompts
              }
          },
      })
    '';
}
