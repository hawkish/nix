{
  config,
  lib,
  ...
}:
{
  config = {
    sops = {
      secrets = {
        private_email = { };
        work_email = lib.mkIf (config.opt.features.work.enable) { };
      };

      templates = {
        # Private PC
        private-git-config.content = lib.generators.toINI { } {
          user = {
            email = config.sops.placeholder.private_email;
            name = "hawkish";
          };
        };
      };
    };
    programs = {
      git = {
        enable = true;
        includes = ([
          # Private
          {
            path = config.sops.templates.private-git-config.path;
          }
        ]);
      };
    };
  };
}
