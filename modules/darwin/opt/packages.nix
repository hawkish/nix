{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    p7zip
    jdk17
    jdk21
    swiftlint
  ];
}
