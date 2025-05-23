{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "hlchunk";
      src = pkgs.fetchFromGitHub {
        owner = "shellRaining";
        repo = "hlchunk.nvim";
        rev = "5465dd33ade8676d63f6e8493252283060cd72ca";
        hash = "sha256-f5VVfpfVZk6ULBWVSVEzXBN9F4ROTzhomV1F2mKIem4=";
      };
    })
  ];

  extraConfigLua = # Lua
    ''

      require("hlchunk").setup({
        chunk = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        line_num = {
          enable = true,
          use_treesitter = true
        }
      })
    '';
}
