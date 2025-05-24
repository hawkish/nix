{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    swiftlint
  ];

  plugins.lint = {
    enable = true;
    lintersByFt = {
      swift = [ "swiftlint" ];
    };
  };
}
