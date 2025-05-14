{ pkgs, config, ... }:
{

  home.file.kitty-theme = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    newSession = true;
    shortcut = "t";
    escapeTime = 0;
  };
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = if config.opt.features.isNixos.enable then 10 else 12;
    };
    settings = {
      shell = "${pkgs.tmux}/bin/tmux a";
    };
    extraConfig = ''
      set -as terminal-features 'xterm*:extkeys'
      set -g default-terminal tmux-256color
      set -g display-time 4000
      set -g history-limit 50000
      set -g status-interval 5
      set -g xterm-keys on
      set -s escape-time 0
      set -s extended-keys on
      set-option -g renumber-windows on
      setw -g mode-keys vi
    '';
  };
}
