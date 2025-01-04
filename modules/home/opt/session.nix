{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    JAVA_HOME = "${pkgs.jdk.home}";
  };
}
