{
  config,
  lib,
  ...
}:
let
  workBrew = lib.optionals config.opt.features.work.enable [
    "chruby"
    "ruby-install"
  ];
  personalBrew = lib.optionals config.opt.features.personal.enable [ ];
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
