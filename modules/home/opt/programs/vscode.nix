{
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
  };

  userSettings = {
    # ...
    "workbench.colorTheme" = "Dracula Theme";
  };
  extensions = [
    pkgs.vscode-marketplace.jnoortheen.nix-ide
    pkgs.vscode-marketplace.dracula-theme.theme-dracula
  ];
}
