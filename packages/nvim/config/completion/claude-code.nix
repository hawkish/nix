{
  config,
  lib,
  ...
}:
{
  plugins.claude-code = lib.mkIf (config.opt.features.personal.enable) {
    enable = true;
  };
}
