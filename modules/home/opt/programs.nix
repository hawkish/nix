{
  pkgs,
  ...
}:
{
  programs = {
    home-manager.enable = true;
    zsh = {
      enable = true;
    };
    git = {
      enable = true;
      userEmail = "mortenhogh@gmail.com";
      userName = "hawkish";
    };
    java = {
      enable = true;
      package = pkgs.jdk23;
    };

  };
}
