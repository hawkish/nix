{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "tokyonight";
      src = pkgs.fetchFromGitHub {
        owner = "folke";
        repo = "tokyonight.nvim";
        rev = "b262293ef481b0d1f7a14c708ea7ca649672e200";
        #hash = "sha256-um9G0BQbj+/SCoPpKz1J+kkhz2dCzKhMaY5tT0U/IrY=";
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
