{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    p7zip
    jdk21
    clojure
    babashka
    neil
    firefox
  ];
}
