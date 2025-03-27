{ pkgs, self, ... }:
let
  commonPkgs = with pkgs; [
    self.packages.${pkgs.system}.nvim

    nodejs
    node2nix

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
in
{
  home.packages = commonPkgs;

}
