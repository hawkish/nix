{ pkgs, ... }:
{
  users.users."mortenhogh" = {
    uid = 1000;
    home = "/Users/mortenhogh";
  };
}
