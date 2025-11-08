{
  imports = [
    ./input.nix
    ./quickfile.nix
    ./picker.nix
    ./bufdelete.nix
    ./bigfile.nix
    ./dashboard.nix
    ./git.nix
    ./rename.nix
    ./statuscolumn.nix
  ];

  plugins.snacks.enable = true;
}
