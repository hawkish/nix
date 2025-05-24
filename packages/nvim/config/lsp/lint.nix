{ ... }:
{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      swift = [ "swiftlint" ];
    };
  };
}
