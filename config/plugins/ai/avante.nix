{
  plugins.avante = {
    enable = true;

    lazyLoad = {
      enable = true;
      settings = {
        event = ["InsertEnter"];
      };
    };

    settings = {
      provider = "copilot";
      input.provider = "dressing";
    };
  };
}
