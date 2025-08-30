{
  plugins.render-markdown = {
    enable = true;
  };

  extraConfigLua = ''
    local ok, render = pcall(require, "render-markdown")
    if ok then
      render.setup({
        file_types = { "markdown", "Avante" }
      })
    end
  '';
}
