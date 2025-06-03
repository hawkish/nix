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
    nodejs_22
    node2nix
    age
    sops
    swift-format
    (pnpm.override { withNode = false; })
  ];

  work = with pkgs; [
    slack
  ];

  private = with pkgs; [
    claude-code # Add any private packages here
  ];
in
{
  home.packages =
    commonPkgs ++ devPkgs ++ (if config.opt.features.work.enable then work else private);

}
