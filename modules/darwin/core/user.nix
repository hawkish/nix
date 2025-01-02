{ pkgs, ... }:
{
  users.users."rune" = {
    uid = 1000;
    home = "/Users/mortenhogh";
  };
}
