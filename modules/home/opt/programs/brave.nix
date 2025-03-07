{
  pkgs,
  ...
}:
{
  programs = {
    git = {
      enable = true;
      userEmail = "mortenhogh@gmail.com";
      userName = "hawkish";
    };
    chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        "gighmmpiobklfepjocnamgkkbiglidom" # adblock
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      ];
      commandLineArgs = [
      ];
    };
  };
}
