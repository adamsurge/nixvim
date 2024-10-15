{
  plugins.oil = {
    enable = true;
    settings = {
      columns = [
        "icon"
      ];
      keymaps = {
        "<C-c>" = false;
        "<C-h>" = false;
        "<C-l>" = false;
        "<C-r>" = "actions.refresh";
        "<leader>q" = "actions.close";
        "y." = "actions.copy_entry_path";
      };
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>o";
      action = "<cmd>Oil<cr>";
      options = {desc = "Open parent directory";};
    }
  ];
}
