{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    p7zip
    jdk23
    clojure
    babashka
    ruby_3_4
  ];
}
