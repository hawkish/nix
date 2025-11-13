{
  homeDir,
  ...
}:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
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
