{
  lib,
  pkgs,
  ...
}: let
  nvimUfo = pkgs.vimPlugins.nvim-ufo.overrideAttrs (old: {
    postInstall =
      (old.postInstall or "")
      + ''
        substituteInPlace $out/lua/ufo/fold/init.lua \
          $out/lua/ufo/preview/init.lua \
          $out/lua/ufo/provider/lsp/nvim.lua \
          --replace-fail "require('async')" "require('ufo-async')"
        cp ${pkgs.vimPlugins.promise-async}/lua/promise.lua $out/lua/
        cp ${pkgs.vimPlugins.promise-async}/lua/async.lua $out/lua/ufo-async.lua
        cp -r ${pkgs.vimPlugins.promise-async}/lua/promise-async $out/lua/
      '';
  });
in {
  opts = {
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = lib.mkForce true;
  };

  plugins.nvim-ufo = {
    enable = true;
    package = nvimUfo;
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
