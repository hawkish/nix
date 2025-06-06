{
  config,
  lib,
  ...
}:
{
  plugins.copilot-chat = lib.mkIf (config.opt.features.work.enable or false) {
    enable = true;
  };
}