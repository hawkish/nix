{
  self,
  pkgs,
  system,
  ...
}:
let
  nodePackages = import ../../../node2nix {
    inherit pkgs system;
    nodejs = pkgs.nodejs;
  };
in
{

  plugins = {
    helm.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        html.enable = true;
        lua_ls.enable = true;
        nixd = {
          # Nix LS
          enable = true;
          settings =
            let
              flake = ''(builtins.getFlake "${self}")'';
              system = ''''${builtins.currentSystem}'';
            in
            {
              nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
              options = rec {
                flake-parts.expr = "${flake}.debug.options";
                nixos.expr = "${flake}.nixosConfigurations.desktop.options";
                home-manager.expr = "${nixos.expr}.home-manager.users.type.getSubOptions [ ]";
                nixvim.expr = "${flake}.packages.${system}.nvim.options";
              };
            };
        };
        jsonls.enable = true;
        jdtls.enable = true;
        helm_ls.enable = true;
        yamlls.enable = true;
        vtsls = {
          enable = true;
          package = nodePackages."@vtsls/language-server";
        };
        eslint.enable = true;
        sqls.enable = true;
        sourcekit.enable = true;
        clojure_lsp = {
          enable = true;
        };
        kotlin_language_server.enable = true;
        gradle_ls = {
          enable = true;
          package = pkgs.vscode-extensions.vscjava.vscode-gradle;
          cmd = [
            "java"
            "-jar"
            "${pkgs.vscode-extensions.vscjava.vscode-gradle}/share/vscode/extensions/vscjava.vscode-gradle/lib/gradle-language-server.jar"
          ];
          settings = {
            init_options = {
              settings = {
                gradleWrapperEnabled = true;
              };
            };
          };
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          # Use LSP saga keybinding instead
          # K = {
          #   action = "hover";
          #   desc = "Hover";
          # };
          # "<leader>cw" = {
          #   action = "workspace_symbol";
          #   desc = "Workspace Symbol";
          # };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
      };
    };
  };
}
