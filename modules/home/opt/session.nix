{ pkgs, ... }:
{
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      JAVA_HOME = "${pkgs.jdk23.home}";
      GEM_HOME = "$HOME/.gem";
      GEM_PATH = "$HOME/.gem";
    };
    sessionPath = [ "$GEM_HOME/bin" ];
  };
}
