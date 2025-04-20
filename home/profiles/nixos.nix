{ self, ... }:
{
  imports = [
    "${self}/modules/home"
  ];

  opt = {
    features = {
      personal.enable = true;
      work.enable = false;
      isNixos.enable = true;
    };
    programs = {
      "1password".enable = true;
      firefox.enable = true;
      wezterm.enable = true;
      alacritty.enable = true;
    };
  };
}
