{pkgs, ...}: {
  extraPackages = with pkgs; [
    ripgrep
  ];

  plugins.grug-far = {
    enable = true;
    settings = {
      engine = "ripgrep";
      engines = {
        ripgrep = {
          path = "rg";
          showReplaceDiff = true;
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>sr";
      action = "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<CR>";
      options = {
        desc = "Search/Replace";
      };
    }
    {
      mode = "v";
      key = "<leader>sr";
      action = "<esc>:'<,'>GrugFarWithin<CR>";
      options = {
        desc = "Search/Replace within";
        silent = true;
      };
    }
  ];
}
