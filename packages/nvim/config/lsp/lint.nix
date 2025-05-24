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
    keymaps = [
      {
        mode = "n";
        key = "<leader>ml";
        action = "<cmd>lua require('lint').try_lint()<cr>";
        options = {
          desc = "Lint file";
          silent = true;
        };
      }
    ];
  };
}
