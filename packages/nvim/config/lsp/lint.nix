{ ... }:
{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      swift = [
        "swiftlint"
      ];
      clojure = [
        "clj-kondo"
      ];
      markdown = [
        "vale"
      ];
      text = [
        "vale"
      ];
    };
  };
}
