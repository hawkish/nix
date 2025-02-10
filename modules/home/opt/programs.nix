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
        search = {
          force = true;
          default = "DuckDuckGo";
          order = [
            "DuckDuckGo"
            "Google"
          ];
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
