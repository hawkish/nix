{ lib, ... }:
{
  options.opt = with lib; {
    programs = {
      firefox.enable = mkEnableOption "Enable Firefox";
      wezterm.enable = mkEnableOption "Enable Wezterm";
      alacritty.enable = mkEnableOption "Enable Alacritty";
    };
  };
}
