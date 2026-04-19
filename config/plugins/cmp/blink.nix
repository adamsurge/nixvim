{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "none";
        "<C-Tab>" = ["select_next" "fallback"];
        "<C-j>" = ["select_next" "fallback"];
        "<C-k>" = ["select_prev" "fallback"];
        "<C-Down>" = ["select_next" "fallback"];
        "<C-Up>" = ["select_prev" "fallback"];
        "<C-e>" = ["hide" "fallback"];
        "<C-b>" = ["scroll_documentation_up" "fallback"];
        "<C-f>" = ["scroll_documentation_down" "fallback"];
        "<C-Space>" = ["show" "show_documentation" "hide_documentation"];
        "<C-CR>" = ["accept" "fallback"];
        "<S-CR>" = ["accept" "fallback"];
      };

      appearance = {
        use_nvim_cmp_as_default = false;
        nerd_font_variant = "mono";
      };

      completion = {
        ghost_text.enabled = false;
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 200;
          window.border = "solid";
        };
        menu.border = "solid";
        accept.auto_brackets.enabled = true;
      };

      signature = {
        enabled = true;
        window.border = "solid";
      };

      snippets.preset = "luasnip";

      sources = {
        default = ["lsp" "path" "buffer" "snippets" "render-markdown"];
        per_filetype = {
          gitcommit = ["git" "buffer" "path"];
          NeogitCommitMessage = ["git" "buffer" "path"];
        };
        providers = {
          git = {
            name = "git";
            module = "blink-cmp-git";
            score_offset = 3;
          };
          "render-markdown" = {
            name = "RenderMarkdown";
            module = "render-markdown.integ.blink";
            fallbacks = ["lsp"];
          };
        };
      };

      cmdline = {
        enabled = true;
        keymap.preset = "cmdline";
      };
    };
  };

  plugins.blink-cmp-git = {
    enable = true;
  };
}
