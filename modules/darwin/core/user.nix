{ pkgs, ... }:
{
  users.users."mortenhogh" = {
    uid = 1000;
    home = "/Users/mortenhogh";
    # home-manager needs a default shell to set environment variables
    shell = pkgs.zsh;
  };
}
