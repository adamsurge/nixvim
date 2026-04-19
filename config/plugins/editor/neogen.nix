{
  plugins.neogen = {
    enable = true;
    settings = {
      snippet_engine = "luasnip";
      languages = {
        rust.template.annotation_convention = "rustdoc";
        python.template.annotation_convention = "google_docstrings";
        lua.template.annotation_convention = "emmylua";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cn";
      action = "<cmd>Neogen<cr>";
      options.desc = "Generate Docstring";
    }
  ];
}
