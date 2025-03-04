{ self, ... }:
{
  imports = [
    "${self}/modules/home"
  ];

  opt = {
    programs = {
      firefox.enable = true;
      wezterm.enable = true;
      alacritty.enable = true;
    };
  };
}
