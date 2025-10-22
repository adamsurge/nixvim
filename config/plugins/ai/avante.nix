{
  plugins.avante = {
    enable = true;

    lazyLoad = {
      enable = true;
      settings = {
        event = ["InsertEnter"];
      };
    };

    settings = {
      provider = "copilot";
      input.provider = "dressing";

      system_prompt.__raw =
        # lua
        ''
          function()
            local hub = require("mcphub").get_hub_instance()
            return hub and hub:get_active_servers_prompt() or ""
          end
        '';

      custom_tools.__raw =
        # lua
        ''
          function()
            return {
              require("mcphub.extensions.avante").mcp_tool(),
            }
          end
        '';
    };
  };
}
