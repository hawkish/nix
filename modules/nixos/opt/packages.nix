{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    p7zip
    brave
    jdk21
    clojure
    babashka
    neil
    firefox
  ];
}
