{
  pkgs,
  inputs,
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

    /*
      firefox = {
        enable = true;
        profiles.default = {
          id = 0;
          name = "Default";
          isDefault = true;
          settings = {
            # Disable about:config warning
            "browser.aboutConfig.showWarning" = false;

            # Mozilla telemetry
            "toolkit.telemetry.enabled" = true;

            # Homepage settings
            # 0 = blank, 1 = home, 2 = last visited page, 3 = resume previous session
            "browser.startup.homepage" = "https://duckduckgo.com";
            "browser.search.defaultenginename" = "DuckDuckGo";
            "browser.search.order.1" = "DuckDuckGo";
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
            # Prefer dark theme
            "layout.css.prefers-color-scheme.content-override" = 0; # 0: Dark, 1: Light, 2: Auto
          };
          extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
            ublock-origin
          ];
          search = {
            force = true;
            default = "DuckDuckGo";
            order = [
              "DuckDuckGo"
              "Google"
            ];

            engines = {
              "Nix Packages" = {
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "type";
                        value = "packages";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };
              "NixOS Wiki" = {
                urls = [ { template = "https://nixos.wiki/index.php?search={searchTerms}"; } ];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@nw" ];
              };
              "Bing".metaData.hidden = true;
              "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
            };
          };
        };
      };
    */
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
