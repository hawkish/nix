{ lib, ... }:
{
  options.opt = with lib; {
    features = {
      personal.enable = mkEnableOption "Enable personal features";
      work.enable = mkEnableOption "Enable work features";
      isNixos.enable = mkEnableOption "Enable NixOS features";
    };
  };
}
