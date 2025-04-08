{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "tokyonight";
      src = pkgs.fetchFromGitHub {
        owner = "nvim";
        repo = "catppuccin";
        rev = "c9e205fe035d622b3c2d66ee42edf368c0c31fd5";
        #hash = "sha256-pMzk1gRQFA76BCnIEGBRjJ0bQ4YOf3qecaU6Fl/nqLE=";
      };
    })
  ];

  extraConfigLua = # Lua
    ''
      require('catppuccin').setup({
        --variant = "storm",
      })
    '';
}
