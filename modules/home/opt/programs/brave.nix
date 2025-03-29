{
  pkgs,
  ...
}:
{
  programs = {
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
