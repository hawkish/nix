{
  config,
  lib,
  isPersonal ? false,
  ...
}:
{
  plugins.claude-code = lib.mkIf isPersonal {
    enable = true;
  };
}
