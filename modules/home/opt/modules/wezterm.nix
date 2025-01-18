{
  ...
}:
{
  programs = {
    wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = # Lua
        ''
          local wezterm = require 'wezterm';
          local config = wezterm.config_builder()

          config.color_scheme = "Catppuccin Mocha"
          config.font = wezterm.font "JetBrainsMono Nerd Font Mono"
          config.font_size = 10.0
          config.window_decorations = "TITLE | RESIZE"
          -- Fixing https://github.com/NixOS/nixpkgs/issues/336069
          --config.front_end = "WebGpu"
          --config.use_ime = false
          config.front_end = "OpenGL"
          config.enable_wayland = true
          return config

        '';
    };
  };
}
