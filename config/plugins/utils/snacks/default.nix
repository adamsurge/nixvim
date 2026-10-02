{
  imports = [
    ./indent.nix
    ./input.nix
    ./notifier.nix
    ./picker.nix
    ./profiler.nix
    ./quickfile.nix
    ./words.nix
    ./bufdelete.nix
    ./bigfile.nix
    ./dashboard.nix
    ./git.nix
    ./rename.nix
    ./statuscolumn.nix
    ./terminal.nix
  ];

  plugins.snacks.enable = true;
}
