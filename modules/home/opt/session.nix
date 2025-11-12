{
  pkgs,
  homeDir,
  ...
}:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    JAVA_HOME_17 = "${pkgs.jdk17.home}";
    JAVA_HOME_21 = "${pkgs.jdk21.home}";
    JAVA_HOME = "${pkgs.jdk21.home}";
    GEM_HOME = "$HOME/.gem";
    GEM_PATH = "$HOME/.gem";
    SOPS_AGE_KEY_FILE = "${homeDir}/.config/sops/age/keys.txt";
  };
  home.sessionPath = [
    "$GEM_HOME/bin"
    "$HOME/.local/bin"
    "$HOME/bin"
    "$HOME/.nix-profile/bin"
    "/opt/homebrew/bin"
  ];
}
