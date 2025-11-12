{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.opt.features.isNixos.enable {
    environment.systemPackages = with pkgs; [
      git
      p7zip
      jdk17
      jdk21
      firefox
    ];
  };
}
