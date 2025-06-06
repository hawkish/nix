{
  config,
  lib,
  isWork ? false,
  ...
}:
{
  plugins.copilot-chat = lib.mkIf isWork {
    enable = true;
  };
}