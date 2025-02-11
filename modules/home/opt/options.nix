{ lib, ... }:
{
  options.opt = with lib; {
    programs = {
      firefox.enable = mkEnableOption "Enable Firefox";
      wezterm.emable = mkEnableOption "Enable Wezterm";
      alacritty.enable = mkEnableOption "Enable Alacritty";
    };
  };
}
