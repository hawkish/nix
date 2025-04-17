{
  pkgs,
  user,
  inputs,
  ...
}:
{
  users.users."${user}" = {
    uid = 1000;
    home = "/Users/${user}";
    # home-manager needs a default shell to set environment variables
    shell = pkgs.zsh;
  };
}
