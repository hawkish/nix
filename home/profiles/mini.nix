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

  home = {
    username = "mortenhogh";
    homeDirectory = "/Users/mortenhogh";
    stateVersion = "24.05";
  };

}
