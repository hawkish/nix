{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "tokyonight";
      src = pkgs.fetchFromGitHub {
        owner = "folke";
        repo = "tokyonight.nvim";
        rev = "b262293ef481b0d1f7a14c708ea7ca649672e200";
        hash = "sha256-pMzk1gRQFA76BCnIEGBRjJ0bQ4YOf3qecaU6Fl/nqLE=";
      };
    })
  ];

  extraConfigLua = # Lua
    ''
      require('tokyonight').setup({
        variant = "storm",
      })
    '';
}
