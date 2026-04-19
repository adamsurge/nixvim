{
  plugins.refactoring = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>r";
      action = "";
      options.desc = "+refactor";
    }
    {
      mode = ["n" "x"];
      key = "<leader>re";
      action.__raw = "function() require('refactoring').refactor('Extract Function') end";
      options.desc = "Extract Function";
    }
    {
      mode = ["n" "x"];
      key = "<leader>rf";
      action.__raw = "function() require('refactoring').refactor('Extract Function To File') end";
      options.desc = "Extract to File";
    }
    {
      mode = ["n" "x"];
      key = "<leader>rv";
      action.__raw = "function() require('refactoring').refactor('Extract Variable') end";
      options.desc = "Extract Variable";
    }
    {
      mode = ["n" "x"];
      key = "<leader>ri";
      action.__raw = "function() require('refactoring').refactor('Inline Variable') end";
      options.desc = "Inline Variable";
    }
    {
      mode = "n";
      key = "<leader>rI";
      action.__raw = "function() require('refactoring').refactor('Inline Function') end";
      options.desc = "Inline Function";
    }
    {
      mode = "n";
      key = "<leader>rb";
      action.__raw = "function() require('refactoring').refactor('Extract Block') end";
      options.desc = "Extract Block";
    }
    {
      mode = "n";
      key = "<leader>rB";
      action.__raw = "function() require('refactoring').refactor('Extract Block To File') end";
      options.desc = "Extract Block to File";
    }
  ];
}
