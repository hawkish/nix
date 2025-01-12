{
  plugins.copilot-lua = {
    enable = true;
    suggestion = {
      enabled = true;
      autoTrigger = true;
    };
    panel.enabled = false;
  };

  extraConfigLua = # Lua
    ''
      require("copilot").setup({
        auto_trigger = true,
        hide_during_completion = false,
        panel = { enabled = false },
      })
    '';
}
