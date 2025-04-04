{
  pkgs,
  config,
  lib,
  ...
}:
let
  onePasswordSock =
    if pkgs.stdenv.isDarwin then
      "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    else
      "~/.1password/agent.sock";
in
{
  config = lib.mkIf config.opt.programs."1password".enable {
    sops = {
      secrets = {
        work_email = lib.mkIf (config.opt.features.work.enable) { };
      };

      templates = {
        # Personal
        personal-ssh-config.content = ''
          Host github.com
            HostName github.com
            User hawkish
            IdentityAgent ${onePasswordSock}
        '';

        work-ssh-config.content = ''
          Host git.bankdata.eficode.io
            User ${config.sops.placeholder.work_email}
            IdentityFile ~/.ssh/eficode_ed25519
          Host github.com
            HostName github.com
            User ${config.sops.placeholder.work_email}
            IdentityAgent ${onePasswordSock}
          Host github.com-personal
            HostName github.com
            User hawkish
            IdentityFile ~/.ssh/github-personal_rsa
        '';

      };
    };

    programs.ssh = lib.mkMerge [
      (lib.mkIf config.opt.features.personal.enable {
        enable = true;
        includes = [ config.sops.templates.personal-ssh-config.path ];
      })
      (lib.mkIf config.opt.features.work.enable {
        enable = true;
        includes = [ config.sops.templates.work-ssh-config.path ];
      })
    ];
  };
}
