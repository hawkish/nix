{
  config,
  lib,
  ...
}:
let
  workContent =
    if config.opt.features.work.enable then
      ''
        # Ruby gem installation
          export GEM_HOME="$HOME/.gem"
          export GEM_PATH="$HOME/.gem"
          export PATH=$GEM_HOME/bin:$PATH

          # Chruby installation
          # enable chruby and select Ruby version
          source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
          source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
          # chruby ruby-3.1.2
          chruby 3.4.2
      ''
    else
      "";
  personalContent =
    if config.opt.features.personal.enable then
      ''
        # Extra commands
        # Other extras
      ''
    else
      "";
  commonContent = ''
    # RustyCommander
    export PATH=$HOME/git/rustycommander/target/release:$PATH
  '';

  initContent = lib.concatStringsSep "\n" [
    workContent
    personalContent
    commonContent
  ];

in
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
      initContent = initContent;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
        theme = "robbyrussell";
      };
    };
  };
}
