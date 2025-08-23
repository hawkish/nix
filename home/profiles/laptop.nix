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
      personal.enable = true;
      work.enable = false;
      isNixos.enable = false;
    };
    programs = {
      "1password".enable = true;
      firefox.enable = true;
      wezterm.enable = false;
      alacritty.enable = false;
    };
  };
}
