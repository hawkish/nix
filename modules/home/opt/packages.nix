{ pkgs, self, ... }:
{
  home.packages = with pkgs; [

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

    self.packages.${pkgs.system}.nvim
  ];
}
