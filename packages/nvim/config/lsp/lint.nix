{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    swiftlint
  ];

  plugins.lint = {
    enable = true;
    settings = {
      lintersByFt = {
        swift = [ "swiftlint" ];
      };
    };
  };
}
