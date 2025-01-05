{ pkgs, ... }:
{
  users.users."mortenhogh" = {
    isSystemUser = true;
    uid = 1000;
    home = "/home/mortenhogh";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    group = "users";
    createHome = true;
    homeMode = "700";
    # home-manager needs a default shell to set environment variables
    shell = pkgs.zsh;
  };
}
