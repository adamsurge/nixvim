{
  plugins.aerial = {
    enable = true;

    settings = {
      backends = ["treesitter" "lsp" "markdown" "asciidoc" "man"];

      layout = {
        maxWidth = [40 0.2];
        defaultDirection = "prefer_right";
        placement = "window";
        resizeToContent = true;
      };

      attachMode = "window";

      filterKind = [
        "Class"
        "Constructor"
        "Enum"
        "Function"
        "Interface"
        "Module"
        "Method"
        "Struct"
      ];

      highlightMode = "split_width";
      highlightClosest = true;
      nerdFont = "auto";

      onAttach = ''
        function(bufnr)
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end
      '';
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>uo";
      action = "<cmd>AerialToggle!<cr>";
      options = {desc = "Toggle Aerial outline";};
    }
  ];
}
