{ inputs, hostname, ... }:
{
  imports = [
    inputs.hm.darwinModules.home-manager
    ./hardware-configuration.nix
  ];
  networking.hostName = hostname;

  opt = {
    features = {
      personal.enable = true;
      work.enable = false;
    };
  }:

}
