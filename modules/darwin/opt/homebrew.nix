{
  config,
  ...
}:
let
  workBrew =
    if config.opt.features.work.enable then
      [
        "chruby"
        "ruby-install"
      ]
    else
      [ ];
  personalBrew = if config.opt.features.personal.enable then [ ] else [ ];
in
{
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    brews = workBrew ++ personalBrew;
    casks = [
      "brave-browser"
      "1Password"
    ];
  };
}
