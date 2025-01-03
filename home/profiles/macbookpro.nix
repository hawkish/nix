{ self, ... }:
{
  imports = [
    "${self}/modules/home"
  ];

  home = {
    username = "mortenhogh";
    homeDirectory = "/Users/mortenhogh";
    stateVersion = "24.05";
  };

}
