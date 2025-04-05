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
    keyMode = "vi";
    shortcut = "b";
    escapeTime = 0;
    shell = lib.getExe pkgs.zsh;
    plugins = with pkgs; [
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.sensible
    ];
    extraConfig = ''

      set -g default-terminal tmux-256color

      set -g xterm-keys on
      set -as terminal-features 'xterm*:extkeys'
      set -s extended-keys on
      set-option -g renumber-windows on

    '';
  };
}
