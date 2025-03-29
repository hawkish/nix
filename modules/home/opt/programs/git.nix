{
  config,
  ...
}:
{
  programs = {
    git = {
      enable = true;
      userEmail = config.sops.secrets.private_email.path;
      userName = "hawkish";
    };
  };
}
