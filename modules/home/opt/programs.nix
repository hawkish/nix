{
  pkgs,
  ...
}:
{
  programs = {
    home-manager.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
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
