{
  config,
  lib,
  ...
}:
{
  plugins.claude-code = lib.mkIf (config.opt.features.work.personal or false) {
    enable = true;
  }
}
