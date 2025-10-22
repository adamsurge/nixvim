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
}
