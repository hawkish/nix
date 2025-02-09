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
            config.front_end = "WebGpu"
            --config.use_ime = false
            --config.front_end = "OpenGL"
            config.enable_wayland = false
            config.mouse_bindings = {
          	{
          		event = { Down = { streak = 1, button = "Right" } },
          		mods = "NONE",
          		action = wezterm.action_callback(function(window, pane)
          			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
          			if has_selection then
          				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
          				window:perform_action(act.ClearSelection, pane)
          			else
          				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
          			end
          		end),
          	},
          }
          return config

        '';
    };
  };
}
