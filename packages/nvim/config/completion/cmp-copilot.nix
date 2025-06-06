{
  config,
  lib,
  ...
}:
{
  plugins.copilot-lua = lib.mkIf (config.opt.features.work.enable or false) {
    enable = true;
    settings = {
      filetypes = {
        "." = true;
        cvs = true;
        gitcommit = true;
        gitrebase = true;
        help = true;
        hgcommit = true;
        markdown = true;
        svn = true;
        yaml = true;
      };
      suggestion = {
        enabled = true;
        auto_trigger = true;
        hide_during_completion = false;
        keymap.accept = "<S-CR>";
      };
      panel.enabled = false;
    };
  };
}