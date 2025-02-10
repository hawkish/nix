{
  self,
  ...
}:
{
  imports = [
    "${self}/modules/home"
  ];

  opt = {
    programs = {
      firefox.enable = false;
    };
  };

  home = {
    username = "mortenhogh";
    homeDirectory = "/Users/mortenhogh";
    stateVersion = "24.05";
  };

}
