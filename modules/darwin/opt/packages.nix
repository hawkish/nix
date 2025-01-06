{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    p7zip
    # firefox is broken in darwin(!)
  ];
}
