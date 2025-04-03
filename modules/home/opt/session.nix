{ pkgs, homeDir, ... }:
{
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      JAVA_HOME = "${pkgs.jdk23.home}";
      GEM_HOME = "$HOME/.gem";
      GEM_PATH = "$HOME/.gem";
      SOPS_AGE_KEY_FILE = "${homeDir}/.config/sops/age/keys.txt";
    };
    sessionPath = [ "$GEM_HOME/bin" ];
  };
}
