{pkgs, ...}: {
  plugins.rustaceanvim = {
    enable = true;
    settings.dap.autoload_configurations = true;
  };

  extraPackages = with pkgs; [
    lldb
  ];
}
