{
  config,
  pkgs,
  self,
  ...
}:
let
  commonPkgs = with pkgs; [
    # Choose the appropriate Neovim variant based on personal.enable and work.enable
    (
      if config.opt.features.personal.enable then
        self.packages.${pkgs.system}.nvim-personal
      else if config.opt.features.work.enable then
        self.packages.${pkgs.system}.nvim-work
      else
        self.packages.${pkgs.system}.nvim
    )

    btop
    dig
    p7zip
    gh
    fzf
    fd
    jq
    yq
    ripgrep
    zoxide

    lazygit

  ];

  devPkgs = with pkgs; [
    # Node toolchain
    nodejs_22
    node2nix
    (pnpm.override { withNode = false; })

    # Nix security
    age
    sops

    # Swift toolchain
    swift-format

    # Rust toolchain (using unstable to avoid macOS clippy build issues)
    pkgs.unstable.rustc
    pkgs.unstable.cargo
    pkgs.unstable.clippy
    pkgs.unstable.rustfmt
    pkgs.unstable.rust-analyzer
    pkgs.unstable.cargo-edit
    evcxr # For conjure Rust REPL support

    # Formatters for nixvim
    prettierd
    eslint_d
    stylua
    shfmt
    nixfmt-rfc-style

    # Nix tools
    nh
  ];

  work = with pkgs; [
    slack
    x3270
  ];

  personal =
    with pkgs;
    [
    ]
    ++ (with pkgs.unstable; [
      # Use unstable version of claude-code
      claude-code
    ]);
in
{
  home.packages =
    commonPkgs
    ++ devPkgs
    ++ (if config.opt.features.work.enable then work else [ ])
    ++ (if config.opt.features.personal.enable then personal else [ ]);

}
