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
      personal.enable = false;
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
