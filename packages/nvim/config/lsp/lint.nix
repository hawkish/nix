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
      nix = [
        "nix"
      ];
      ruby = [
        "ruby"
      ];
      eslint = [
        "eslint"
      ];
      zsh = [
        "zsh"
      ];

    };
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
}
