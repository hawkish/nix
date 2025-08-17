{
  pkgs,
  inputs,
  ...
}:
{

  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
  ];

  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        "workbench.colorTheme" = "Dracula Theme";
      };
      extensions = with pkgs.vscode-marketplace; [
        # Essential extensions
        jnoortheen.nix-ide
        dracula-theme.theme-dracula
        pkief.material-icon-theme
        esbenp.prettier-vscode
        github.copilot
        github.copilot-chat
        # Angular
        johnpapa.angular2
        angular.ng-template
        dbaeumer.vscode-eslint
        # JAVA_HOME
        vscjava.vscode-java-pack
        vscjava.vscode-gradle
        vscjava.vscode-java-debug
        vscjava.vscode-java-test
        redhat.vscode-quarkus
      ];
    };
  };
}
