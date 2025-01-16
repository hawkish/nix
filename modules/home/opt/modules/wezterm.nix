{
  config,
  lib,
  ...
}:
{
  programs = {
    wezterm = {
      enable = true;
      enableZshIntegration = true;
      colorSchemes = {
        enur = {
          foreground = "#FFFFFF";
          background = "#000000";

          cursor_fg = "#000000";
          cursor_bg = "#FFFFFF";
          cursor_border = "#FFFFFF";

          selection_fg = "#FFFFFF";
          selection_bg = "#44475a";

          ansi = [
            "#000000"
            "#FF3C3C"
            "#00FF00"
            "#FFFF5A"
            "#4F9DFF"
            "#FF4FD8"
            "#4DFFFF"
            "#CCCCCC"
          ];
          brights = [
            "#7F7F7F"
            "#FF7373"
            "#32FF32"
            "#FFFF82"
            "#74AFFF"
            "#FF74E3"
            "#73FFFF"
            "#FFFFFF"
          ];
        };
      };
      extraConfig = # Lua
        ''
          local wezterm = require 'wezterm';
          local config = wezterm.config_builder()

          config.color_scheme = "Catppuccin Mochar"
          config.font = wezterm.font "JetBrainsMono Nerd Font Mono"
          config.font_size = 10.0
          config.window_decorations = "TITLE | RESIZE"
          -- Fixing https://github.com/NixOS/nixpkgs/issues/336069
          config.front_end = "WebGpu"
          config.enable_wayland = false
          return config

        '';
    };
  };
}
