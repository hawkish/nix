{ self, ... }:
{
  imports = [
    "${self}/modules/home"
  ];

  opt = {
    programs = {
      firefox.enable = true;
    };
  };

  home = {
    username = "mortenhogh";
    homeDirectory = "/home/mortenhogh";
    stateVersion = "24.05";
  };
}
