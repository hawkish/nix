{
  pkgs,
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
    java = {
      enable = true;
      package = pkgs.jdk23;
    };
    firefox = {
      enable = true;
    };
  };
}
