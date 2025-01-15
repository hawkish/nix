{
  config,
  lib,
  ...
}:
{
  programs = {
    wezterm = {
      enable = true;
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
          return {
            color_scheme = "enur",
            font = wezterm.font("JetBrainsMono Nerd Font Mono"),
            font_size = 10.0,
          }
        '';
    };
  };
}
