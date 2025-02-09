{
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    casks = [
      #"brave-browser"
    ];
  };
}
