{lib, ...}: {
  opts = {
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = lib.mkForce true;
  };

  plugins.nvim-ufo = {
    enable = true;
    settings = {
      provider_selector = ''
        function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end
      '';
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "zR";
      action = "<cmd>lua require('ufo').openAllFolds()<cr>";
      options = {desc = "Open All Folds";};
    }
    {
      mode = "n";
      key = "zM";
      action = "<cmd>lua require('ufo').closeAllFolds()<cr>";
      options = {desc = "Close All Folds";};
    }
    {
      mode = "n";
      key = "zr";
      action = "<cmd>lua require('ufo').openFoldsExceptKinds()<cr>";
      options = {desc = "Open Folds Except Kinds";};
    }
    {
      mode = "n";
      key = "zm";
      action = "<cmd>lua require('ufo').closeFoldsWith()<cr>";
      options = {desc = "Close Folds With";};
    }
    {
      mode = "n";
      key = "K";
      action = "<cmd>lua local winid = require('ufo').peekFoldedLinesUnderCursor(); if not winid then vim.lsp.buf.hover() end<cr>";
      options = {desc = "Peek Fold or LSP Hover";};
    }
  ];
}
