{pkgs, ...}: let
  codelldb = pkgs.vscode-extensions.vadimcn.vscode-lldb;
  codelldb_ext = "${codelldb}/share/vscode/extensions/vadimcn.vscode-lldb";
in {
  plugins.rustaceanvim = {
    enable = true;
    settings = {
      dap = {
        autoload_configurations = true;
        adapter.__raw = ''
          (function()
            return require("rustaceanvim.config").get_codelldb_adapter(
              "${codelldb_ext}/adapter/codelldb",
              "${codelldb_ext}/lldb/lib/liblldb.so"
            )
          end)()
        '';
      };
      server.default_settings = {
        "rust-analyzer" = {
          check.command = "clippy";
          cargo.features = "all";
          procMacro.enable = true;
          inlayHints = {
            bindingModeHints.enable = true;
            closureCaptureHints.enable = true;
            closureReturnTypeHints.enable = "always";
            discriminantHints.enable = "always";
            expressionAdjustmentHints.enable = "always";
            lifetimeElisionHints.enable = "skip_trivial";
          };
        };
      };
    };
  };

  plugins.crates = {
    enable = true;
    settings = {
      completion.crates.enabled = true;
      lsp = {
        enabled = true;
        actions = true;
        hover = true;
      };
    };
  };
}
