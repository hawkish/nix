{ pkgs, helpers, ... }:
let
  swiftFormatConfig = {
    version = 1;
    indentation.spaces = 4;
    lineLength = 100;
    maximumBlankLines = 1;
    respectsExistingLineBreaks = true;
    lineBreakBeforeControlFlowKeywords = false;
    lineBreakBeforeEachArgument = false;
  };
in
{
  extraPackages = with pkgs; [
    prettierd
    shfmt
    stylua
    nixfmt-rfc-style
    google-java-format
    xmlformat
  ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_after_save = {
        lspFallback = true;
        async = true;
      };

      notify_on_error = true;

      formatters = {
        npm_groovy_lint = {
          command = "npm-groovy-lint";
          stdin = false;
          args = [
            # "--rulesets"
            # "'Indentation{\"spacesPerIndentLevel\":2,\"severity\":\"warning\"}'"
            # "--rulesetsoverridetype"
            # "appendConfig"
            "--fix"
            "--nolintafter"
            "--failon"
            "none"
            "$FILENAME"
          ];
        };
        spotless-format = {
          meta = {
            url = "https://github.com/diffplug/spotless";
            description = "Spotless plugin for Gradle";
          };
          stdin = true;
          requireCwd = true;
          cwd = helpers.mkRaw ''require("conform.util").root_file({ "gradlew" })'';
          command = "./gradlew";
          args = helpers.mkRaw ''
            function()
              return {
                "spotlessApply",
                "-PspotlessIdeHook=" .. vim.api.nvim_buf_get_name(0),
                "-PspotlessIdeHookUseStdIn",
                "-PspotlessIdeHookUseStdOut",
                "--no-configuration-cache",
                "--quiet",
              }
            end
          '';
        };
        google-java-format = {
          prepend_args = [ "--aosp" ];
        };
        swift_format = {
          prepend_args = [
            "--configuration"
            "${pkgs.writeText "swift-format-config.json" (builtins.toJSON swiftFormatConfig)}"
          ];
        };
      };
      formatters_by_ft = {
        # "_" = [ "trim_whitespace" ]; # Disabled - package not available
        css = [ "prettierd" ];
        graphql = [ "prettierd" ];
        # groovy = [ "npm_groovy_lint" ]; # Disabled - package not installed
        handlebars = [ "prettierd" ];
        html = [ "prettierd" ];
        java = [ "spotless-format" ]; # Keep - has custom formatter defined
        javascript = [ "prettierd" ];
        javascriptreact = [ "prettierd" ];
        json = [ "prettierd" ];
        jsonc = [ "prettierd" ];
        less = [ "prettierd" ];
        lua = [ "stylua" ];
        markdown = [ "prettierd" ];
        markdownd = [ "prettierd" ];
        nix = [ "nixfmt" ];
        scss = [ "prettierd" ];
        sh = [ "shfmt" ];
        typescript = [
          "prettierd"
          "eslint_d"
        ];
        typescriptreact = [ "prettierd" ];
        vue = [ "prettierd" ];
        # xml = [ "xmlformat" ]; # Disabled - package not available
        yaml = [ "prettierd" ];
        swift = [ "swift_format" ];
        rust = [ "rustfmt" ];
      };
    };
  };
}
