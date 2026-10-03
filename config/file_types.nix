{
  autoGroups = {
    filetypes = {};
    spell = {};
  };

  autoCmd = [
    {
      group = "spell";
      event = ["FileType"];
      pattern = ["markdown" "gitcommit" "text" "rst" "asciidoc" "tex"];
      callback = {
        __raw = "function() vim.opt_local.spell = true end";
      };
    }
  ];

  files."ftdetect/bicepft.lua".autoCmd = [
    {
      group = "filetypes";
      event = ["BufRead" "BufNewFile"];
      pattern = ["*.bicep" "*.bicepparam"];
      command = "set ft=bicep";
    }
  ];
}
