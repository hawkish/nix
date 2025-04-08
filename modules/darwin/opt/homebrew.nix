{
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    brews = [
      "chruby"
      "ruby-install"
    ];
    casks = [
      "brave-browser"
      "1Password"
    ];
  };
}
