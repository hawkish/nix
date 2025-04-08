{
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    brews = [
      "chruby"
    ];
    casks = [
      "brave-browser"
      "1Password"
    ];
  };
}
