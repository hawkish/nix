{
  config,
  pkgs,
  lib,
  ...
}:
let
  workContent = lib.optionalString config.opt.features.work.enable ''
    # Ruby gem installation
    export GEM_HOME="$HOME/.gem"
    export GEM_PATH="$HOME/.gem"
    export PATH=$GEM_HOME/bin:$PATH

    # Chruby installation
    # enable chruby and select Ruby version
    source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
    source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
    chruby 3.4.2

    # X3270 installation
    export PATH=${pkgs.x3270}/bin:$PATH
  '';

  personalContent = lib.optionalString config.opt.features.personal.enable ''
    # Extra commands
    # Other extras
  '';

  commonContent = ''
    # Java installation
    export JAVA_HOME_17="${pkgs.jdk17.home}"
    export JAVA_HOME_21="${pkgs.jdk21.home}"
    export JAVA_HOME="${pkgs.jdk21.home}"
    export PATH=$JAVA_HOME/bin:$PATH

    # RustyCommander
    export PATH=$HOME/git/rustycommander/target/release:$PATH
  '';

in
{
  programs.zsh = {
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

    # Use initExtra (standard option) instead of initContent
    initExtra = lib.concatStringsSep "\n" [
      workContent
      personalContent
      commonContent
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}
