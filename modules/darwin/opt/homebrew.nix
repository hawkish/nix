{
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    formulae = [
      "chruby"
    ];
    casks = [
      "brave-browser"
      "1Password"
    ];
  };
}
