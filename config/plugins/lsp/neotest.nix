{pkgs, ...}: {
  plugins.neotest = {
    enable = true;
    settings = {
      adapters = [
        # rustaceanvim ships its own neotest adapter
        {__raw = "require('rustaceanvim.neotest')";}
        {__raw = "require('neotest-python')({runner = 'pytest'})";}
        {__raw = "require('neotest-go')({})";}
      ];
      output.open_on_run = false;
      status = {
        virtual_text = true;
        signs = true;
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    neotest-python
    neotest-go
  ];

  extraPackages = with pkgs; [
    go
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>T";
      action = "";
      options.desc = "+test";
    }
    {
      mode = "n";
      key = "<leader>Tr";
      action.__raw = "function() require('neotest').run.run() end";
      options.desc = "Run Nearest";
    }
    {
      mode = "n";
      key = "<leader>Tf";
      action.__raw = "function() require('neotest').run.run(vim.fn.expand('%')) end";
      options.desc = "Run File";
    }
    {
      mode = "n";
      key = "<leader>Ta";
      action.__raw = "function() require('neotest').run.run(vim.uv.cwd()) end";
      options.desc = "Run All (cwd)";
    }
    {
      mode = "n";
      key = "<leader>Tl";
      action.__raw = "function() require('neotest').run.run_last() end";
      options.desc = "Run Last";
    }
    {
      mode = "n";
      key = "<leader>Td";
      action.__raw = "function() require('neotest').run.run({strategy='dap'}) end";
      options.desc = "Debug Nearest";
    }
    {
      mode = "n";
      key = "<leader>Ts";
      action.__raw = "function() require('neotest').run.stop() end";
      options.desc = "Stop";
    }
    {
      mode = "n";
      key = "<leader>To";
      action.__raw = "function() require('neotest').output.open({enter=true, auto_close=true}) end";
      options.desc = "Show Output";
    }
    {
      mode = "n";
      key = "<leader>TO";
      action.__raw = "function() require('neotest').output_panel.toggle() end";
      options.desc = "Toggle Output Panel";
    }
    {
      mode = "n";
      key = "<leader>TS";
      action.__raw = "function() require('neotest').summary.toggle() end";
      options.desc = "Toggle Summary";
    }
    {
      mode = "n";
      key = "<leader>Tw";
      action.__raw = "function() require('neotest').watch.toggle(vim.fn.expand('%')) end";
      options.desc = "Toggle Watch";
    }
  ];
}
