{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        background = {
          light = "macchiato";
          dark = "mocha";
        };

        flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
        no_bold = false;
        no_italic = false;
        no_underline = false;
        transparent_background = true;
        show_end_of_buffer = true;
        term_colors = true;
        dim_inactive = {
          enabled = true;
          shade = "dark";
          percentage = 0.15;
        };
        styles = {
          comments = ["italic"];
          conditionals = ["italic"];
          loops = [];
          functions = [];
          keywords = [];
          strings = [];
          variables = [];
          numbers = [];
          booleans = [];
          properties = [];
          types = [];
          operators = [];
          miscs = {};
        };

        underlines = {
          errors = ["underline"];
          hints = ["underline"];
          warnings = ["underline"];
          information = ["underline"];
          ok = ["underline"];
        };
        inlay_hints = {
          background = true;
        };
        color_overrides = {};
        custom_highlights = {};
        default_integrations = true;
        auto_integrations = true;
        integrations = {
          cmp = true;
          notify = true;
          gitsigns = {
            enabled = true;
            transparent = true;
          };
          neotree = true;
          which_key = true;
          flash = true;
          fidget = true;
          illuminate = {
            enabled = true;
            lsp = true;
          };
          navic = {
            enabled = true;
            custom_bg = "lualine";
          };
          treesitter = true;
          telescope = true;
          indent_blankline = {
            enabled = true;
            scope_color = "lavender";
            colored_indent_levels = true;
          };
          mini = {
            enabled = true;
            indentscope_color = "lavender";
          };
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            virtual_text = {
              errors = ["italic"];
              hints = ["italic"];
              information = ["italic"];
              warnings = ["italic"];
              ok = ["italic"];
            };
            underlines = {
              errors = ["underline"];
              hints = ["underline"];
              information = ["underline"];
              warnings = ["underline"];
              ok = ["underline"];
            };
          };
          aerial = true;
          diffview = true;
          treesitter_context = true;
          grug_far = true;
          ufo = true;
          noice = true;
          lsp_trouble = true;
          dap = true;
          dap_ui = true;
          render_markdown = true;
          snacks = {
            enabled = true;
            indent_scope_color = "lavender";
          };
        };
      };
    };
  };
}
