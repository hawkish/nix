{ self, ... }:
{
  imports = [
    "${self}/modules/home"
  ];

  home = {
    username = "mortenhogh";
    homeDirectory = "/home/mortenhogh";
    stateVersion = "24.05";
  };
}
