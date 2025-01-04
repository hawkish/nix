{ pkgs, self, ... }:
{
  home.packages = with pkgs; [

    nodejs
    node2nix
    python3

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
