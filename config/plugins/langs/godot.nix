{
  lib,
  system,
  ...
}: {
  plugins.godot = lib.mkIf (system == "x86_64-linux") {
    enable = true;
  };
}
