{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  programs = {
    home-manager.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        gs = "git status";
        gc = "git commit";
        ga = "git add";
        gd = "git diff";
        gb = "git branch";
        gl = "git log";
        gsb = "git show-branch";
        gco = "git checkout";
        gg = "git grep";
        gk = "gitk --all";
        gr = "git rebase";
        gri = "git rebase --interactive";
        gcp = "git cherry-pick";
        grm = "git rm";
        grp = "git remote prune origin";
        gp = "git push";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
        theme = "robbyrussell";
      };
    };
    git = {
      enable = true;
      userEmail = "mortenhogh@gmail.com";
      userName = "hawkish";
    };
    config = lib.mkIf config.opt.programs.firefox.enable {
      firefox = {
        enable = true;
        profiles = {
          default = {
            id = 0;
            name = "default";
            isDefault = true;
            settings = {
              "browser.startup.homepage" = "https://duckduckgo.com";
              "browser.search.defaultenginename" = "DuckDuckGo";
              "browser.search.order.1" = "DuckDuckGo";
              "signon.rememberSignons" = false;
              "widget.use-xdg-desktop-portal.file-picker" = 1;
              "browser.aboutConfig.showWarning" = false;
              "browser.compactmode.show" = true;
              "browser.cache.disk.enable" = false;
              "widget.disable-workspace-management" = true;
              "mousewheel.default.delta_multiplier_x" = 70;
              "mousewheel.default.delta_multiplier_y" = 70;
              "mousewheel.default.delta_multiplier_z" = 70;
              "browser.newtabpage.pinned" = [
                {
                  "label" = "GitHub";
                  "url" = "https://github.com";
                }
                {
                  "label" = "YouTube";
                  "url" = "https://youtube.com";
                }
              ];
            };
            search = {
              force = true;
              default = "DuckDuckGo";
              order = [
                "DuckDuckGo"
                "Google"
              ];
            };
            extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
              ublock-origin
            ];
          };
        };
      };
    };
    chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        "gighmmpiobklfepjocnamgkkbiglidom" # adblock
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      ];
      commandLineArgs = [
      ];
    };
  };
}
