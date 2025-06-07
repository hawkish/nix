{ ... }:
{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      swift = [
        "swiftlint"
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
