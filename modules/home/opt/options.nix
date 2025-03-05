{ lib, ... }:
{
  options.opt = with lib; {
    programs = {
      "1password".enable = mkEnableOption "Enable 1Password";
      firefox.enable = mkEnableOption "Enable Firefox";
      wezterm.enable = mkEnableOption "Enable Wezterm";
      alacritty.enable = mkEnableOption "Enable Alacritty";
    };
  };
}
