{
  plugins = {
    treesj = {
      enable = true;
      settings = {
        use_default_keymaps = false;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>M";
      action = "<cmd>TSJToggle<cr>";
      options = {desc = "Toggle TreeSJ Split/Join";};
    }
  ];
}
