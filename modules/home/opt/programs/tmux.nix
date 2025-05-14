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
    shortcut = "t";
    escapeTime = 0;
    shell = lib.getExe pkgs.zsh;
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];
    settings = {
      shell = "${pkgs.tmux}/bin/tmux a";
    };
    extraConfig = ''

      set -g default-terminal tmux-256color
      set -g default-shell "${pkgs.zsh}/bin/zsh"
      set -g default-command "${pkgs.zsh}/bin/zsh"

      set -g xterm-keys on
      set -as terminal-features 'xterm*:extkeys'
      set -s extended-keys on
      set-option -g renumber-windows on

      # Mouse works as expected
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

    '';
  };
}
