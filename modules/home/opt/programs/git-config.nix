{
  config,
  lib,
  ...
}:
{
  config = {
    sops = {
      secrets = {
        private_email = lib.mkIf (config.opt.features.personal.enable) { };
        work_email = lib.mkIf (config.opt.features.work.enable) { };
      };

      templates = {
        # Personal
        personal-git-config = lib.mkIf (config.opt.features.personal.enable) {
          content = lib.generators.toINI { } {
            user = {
              email = config.sops.placeholder.private_email;
              name = "hawkish";
            };
          };
        };

        work-git-config = lib.mkIf (config.opt.features.work.enable) {
          content = lib.generators.toINI { } {
            user = {
              email = config.sops.placeholder.work_email;
              name = "Morten Høgh";
            };
          };
        };
      };
    };
    programs = {
      git = {
        enable = true;
        extraConfig = {
          mergetool.nvimdiff = {
            layout = "LOCAL,BASE,REMOTE / MERGED";
          };
        };
        includes = (
          if config.opt.features.work.enable then
            [
              # Work
              {
                path = config.sops.templates.work-git-config.path;
              }

            ]
          else
            [
              # Personal
              {
                path = config.sops.templates.personal-git-config.path;
              }
            ]
        );
      };
    };
  };
}
