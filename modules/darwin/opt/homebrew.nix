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
        "autoconf"
        "automake"
        "bison"
        "ca-certificates"
        "libffi"
        "libyaml"
        "m4"
        "openssl@3"
        "readline"
        "xz"
      ]
    else
      [ ];
  personalBrew = if config.opt.features.personal.enable then [ ] else [ ];
  sharedBrew = [ ];
in
{
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    brews = workBrew ++ personalBrew ++ sharedBrew;
    casks = [
      "brave-browser"
      "1Password"
    ];
  };
}
