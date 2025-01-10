{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    p7zip
    brave
    jdk23
    clojure
    babashka
  ];
}
