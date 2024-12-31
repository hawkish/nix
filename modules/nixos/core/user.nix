{ pkgs, ... }:
{
  users.users."mortenhogh" = {
    isSystemUser = true;
    uid = 1000;
    home = "/home/mortenhogh";
    extraGroups = [ "networkmanager" "wheel" ];

    group = "users";
    createHome = true;
    homeMode = "700";
    useDefaultShell = true;
  };
}
