{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    swiftlint
  ];

  plugins.nvim-lint = {
    enable = true;
    settings = {
      linters_by_ft = {
        swift = [ "swiftlint" ];
      };
    };
  };
}
