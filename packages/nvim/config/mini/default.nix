{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
  };

  imports = [
    ./bracketed.nix
    ./diff.nix
    ./hipatterns.nix
    ./icons.nix
    ./move.nix
    ./surround.nix
  ];
}
