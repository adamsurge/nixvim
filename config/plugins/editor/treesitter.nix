{pkgs, ...}: {
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        ensure_installed = [
          "gdscript"
          "godot_resource"
        ];
        ts-autotag.enable = true;
      };
      folding.enable = false;
      nixvimInjections = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };

    treesitter-textobjects = {
      enable = true;
      settings = {
        enable = true;
        lookahead = true;
      };
    };
  };

  keymaps = [
    {
      mode = ["x" "o"];
      key = "af";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects") end
      '';
      options.desc = "Select outer function";
    }
    {
      mode = ["x" "o"];
      key = "if";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects") end
      '';
      options.desc = "Select inner function";
    }
    {
      mode = ["x" "o"];
      key = "ac";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects") end
      '';
      options.desc = "Select outer class";
    }
    {
      mode = ["x" "o"];
      key = "ic";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects") end
      '';
      options.desc = "Select inner class";
    }
    {
      mode = ["x" "o"];
      key = "ai";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects") end
      '';
      options.desc = "Select outer conditional";
    }
    {
      mode = ["x" "o"];
      key = "ii";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects") end
      '';
      options.desc = "Select inner conditional";
    }
    {
      mode = ["x" "o"];
      key = "al";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects") end
      '';
      options.desc = "Select outer loop";
    }
    {
      mode = ["x" "o"];
      key = "il";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects") end
      '';
      options.desc = "Select inner loop";
    }
    {
      mode = ["x" "o"];
      key = "at";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects") end
      '';
      options.desc = "Select outer comment";
    }
    {
      mode = ["x" "o"];
      key = "aa";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects") end
      '';
      options.desc = "Select outer parameter";
    }
    {
      mode = ["x" "o"];
      key = "ia";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects") end
      '';
      options.desc = "Select inner parameter";
    }
    {
      mode = "n";
      key = "]m";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end
      '';
      options.desc = "Next function start";
    }
    {
      mode = "n";
      key = "[m";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end
      '';
      options.desc = "Previous function start";
    }
    {
      mode = "n";
      key = "]M";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end
      '';
      options.desc = "Next function end";
    }
    {
      mode = "n";
      key = "[M";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end
      '';
      options.desc = "Previous function end";
    }
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner") end
      '';
      options.desc = "Swap next parameter";
    }
    {
      mode = "n";
      key = "<leader>A";
      action.__raw = ''
        function() require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer") end
      '';
      options.desc = "Swap previous parameter";
    }
  ];
}
