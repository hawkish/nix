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

    tokyonight

  ];

  devPkgs = with pkgs; [
    nodejs_22
    node2nix
    age
    sops
    (pnpm.override { withNode = false; })
  ];

  work = with pkgs; [
    slack
  ];
in
{
  home.packages = commonPkgs ++ devPkgs ++ (if config.opt.features.work.enable then work else [ ]);

}
