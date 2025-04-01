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
      work.enable = true;
    };
    programs = {
      "1password".enable = true;
      firefox.enable = false;
      wezterm.enable = false;
      alacritty.enable = false;
    };
  };
}
