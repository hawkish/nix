{
  programs = {
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
      #oh-my-zsh = {
      #  enable = true;
      #  plugins = [
      #    "git"
      #  ];
      #theme = "robbyrussell";
      #};
    };
  };
}
