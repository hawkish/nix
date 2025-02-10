{ lib, ... }:
{
  options.opt = with lib; {
    programs = {
      firefox.enable = mkEnableOption "Enable Firefox";
    };
  };
}
