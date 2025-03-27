{
  config,
  pkgs,
  self,
  ...
}:
let
  commonPkgs = with pkgs; [
    self.packages.${pkgs.system}.nvim

    btop
    dig
    p7zip
    gh
    fzf
    fd
    jq
    yq
    ripgrep

    lazygit

  ];

  devPkgs = with pkgs; [
    nodejs
    node2nix
  ];

  work = with pkgs; [
    slack
  ];
in
{
  home.packages = commonPkgs ++ devPkgs ++ (if config.opt.features.work.enable then work else [ ]);

}
