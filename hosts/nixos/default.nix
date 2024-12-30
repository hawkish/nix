{ inputs, ... }:
{
  imports = [
    inputs.hm.nixosModule
    ./configuration.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "nixos";
}
