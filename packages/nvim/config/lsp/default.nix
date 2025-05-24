{
  imports = [
    ./conform.nix
    ./conjure.nix
    #./jdtls.nix broken by https://github.com/nix-community/nixvim/pull/3167
    ./lsp.nix
    ./lint.nix
  ];
}
