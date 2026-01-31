{
  plugins.opencode = {
    enable = true;

    settings = {
      port = 8080;

      provider = {
        enabled = "snacks";
        snacks = {
          auto_close = true;
          win = {
            position = "right";
            enter = false;
            wo = {winbar = "";};
            bo = {filetype = "opencode_terminal";};
          };
        };
      };

      events = {
        enabled = true;
        reload = true;
        permissions = {
          enabled = true;
          idle_delay_ms = 1000;
        };
      };

      prompts = {
        code_review = {
          description = "Review current code for issues and improvements";
          prompt = "Please review this code for potential issues, security vulnerabilities, and improvements. Focus on best practices, performance, and maintainability.";
        };
        refactor = {
          description = "Refactor selected code to improve structure and readability";
          prompt = "Refactor this code to improve its structure, readability, and maintainability while preserving functionality.";
        };
        explain = {
          description = "Explain what the selected code does";
          prompt = "Explain what this code does, its purpose, and how it works in simple terms.";
        };
        diagnostics = {
          prompt = "Explain @diagnostics";
        };
        optimize = {
          prompt = "Optimize @this for performance and readability";
        };
        review = {
          prompt = "Review @this for correctness and readability";
        };
        test = {
          prompt = "Add tests for @this";
        };
      };

      ask = {
        prompt = "Ask opencode: ";
        blink_cmp_sources = ["opencode" "buffer"];
        snacks = {
          win = {
            title_pos = "left";
            relative = "cursor";
            row = -3;
            col = 0;
          };
        };
      };

      select = {
        prompt = "opencode: ";
        snacks = {
          preview = "preview";
          layout = {
            preset = "vscode";
            hidden = [];
          };
        };
      };
    };
  };

  opts.autoread = true;

  keymaps = [
    {
      mode = ["n" "x"];
      key = "<leader>o";
      action = "";
      options = {
        desc = "opencode";
      };
    }
    {
      mode = ["n" "x"];
      key = "<leader>oa";
      action.__raw = ''function() require("opencode").ask("@this: ", { submit = true }) end'';
      options.desc = "Ask opencode…";
    }
    {
      mode = ["n" "x"];
      key = "<leader>ox";
      action.__raw = ''function() require("opencode").select() end'';
      options.desc = "Execute opencode action…";
    }
    {
      mode = ["n" "t"];
      key = "<leader>ot";
      action.__raw = ''function() require("opencode").toggle() end'';
      options.desc = "Toggle opencode";
    }
    {
      mode = ["n" "x"];
      key = "go";
      action.__raw = ''function() return require("opencode").operator("@this ") end'';
      options.expr = true;
      options.desc = "Add range to opencode";
    }
    {
      mode = "n";
      key = "goo";
      action.__raw = ''function() return require("opencode").operator("@this ") .. "_" end'';
      options.expr = true;
      options.desc = "Add line to opencode";
    }
    {
      mode = "n";
      key = "<leader>ou";
      action.__raw = ''function() require("opencode").command("session.half.page.up") end'';
      options.desc = "Scroll opencode up";
    }
    {
      mode = "n";
      key = "<leader>od";
      action.__raw = ''function() require("opencode").command("session.half.page.down") end'';
      options.desc = "Scroll opencode down";
    }
    {
      mode = "n";
      key = "<C-S-u>";
      action.__raw = ''function() require("opencode").command("session.half.page.up") end'';
      options.desc = "Scroll opencode up";
    }
    {
      mode = "n";
      key = "<C-S-d>";
      action.__raw = ''function() require("opencode").command("session.half.page.down") end'';
      options.desc = "Scroll opencode down";
    }
  ];
}
