{
  config,
  pkgs,
  self,
  ...
}:
let
  commonPkgs = with pkgs; [
    # Choose the appropriate Neovim variant based on personal.enable and work.enable
    (if config.opt.features.personal.enable then
      self.packages.${pkgs.system}.nvim-personal
    else if config.opt.features.work.enable then
      self.packages.${pkgs.system}.nvim-work
    else
      self.packages.${pkgs.system}.nvim)

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
    
    # Rust toolchain
    rustc
    cargo
    rustfmt
    rust-analyzer
  ];

  work = with pkgs; [
    slack
  ];

  personal = with pkgs; [
    claude-code # Add any private packages here
  ];
in
{
  home.packages =
    commonPkgs
    ++ devPkgs
    ++ (if config.opt.features.work.enable then work else [ ])
    ++ (if config.opt.features.personal.enable then personal else [ ]);

}
