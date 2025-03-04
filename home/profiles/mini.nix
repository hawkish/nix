{ self, ... }:
{
  imports = [
    "${self}/modules/home"
  ];

  opt = {
    programs = {
      firefox.enable = false;
      wezterm.enable = false;
      alacritty.enable = false;
    };
  };
}
