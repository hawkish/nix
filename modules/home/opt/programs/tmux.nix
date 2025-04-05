{
  lib,
  pkgs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    newSession = true;
    shortcut = "t";
    escapeTime = 0;
    plugins = with pkgs; [
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.sensible
    ];
    extraConfig = ''

      set -g default-terminal tmux-256color

    '';
  };
}
