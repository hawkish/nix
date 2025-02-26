{ inputs, hostname, ... }:
{
  imports = [
    inputs.hm.darwinModules.homemanager
    ./hardware-configuration.nix
  ];
  networking.hostName = hostname;
}
