{ config, lib, ... }:
{
  config = {
    programs._1password.enable = true;
    programs._1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "morten" ];
    };
  };
}
