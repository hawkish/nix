{ self, ... }:
{
  imports = [
    "${self}/modules/home"
  ];

  opt = {
    programs = {
      "1password".enable = true;
      firefox.enable = true;
      wezterm.enable = true;
      alacritty.enable = true;
    };
  };
}
