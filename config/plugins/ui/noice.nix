{
  plugins.noice = {
    enable = true;
    lsp.override = {
      "cmp.entry.get_documentation" = true;
      "vim.lsp.util.convert_input_to_markdown_lines" = true;
      "vim.lsp.util.stylize_markdown" = true;
    };
    presets = {
      long_message_to_split = true;
      command_palette = true;
      bottom_search = true;
      inc_rename = false;
      lsp_doc_border = false;
    };
    notify.enabled = false;
    messages.enabled = false;
  };
}
