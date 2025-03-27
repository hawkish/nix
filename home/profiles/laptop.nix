{
  self,
  ...
}:
{
  imports = [
    "${self}/modules/home"
  ];

  opt = {
    features = {
      work.enable = false;
    };
    programs = {
      "1password".enable = true;
      firefox.enable = false;
      wezterm.enable = false;
      alacritty.enable = false;
    };
  };
}
