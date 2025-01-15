{
  pkgs,
  ...
}:
{
  programs = {
    home-manager.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        gs = "git status";
        gc = "git commit";
        ga = "git add";
        gd = "git diff";
        gb = "git branch";
        gl = "git log";
        gsb = "git show-branch";
        gco = "git checkout";
        gg = "git grep";
        gk = "gitk --all";
        gr = "git rebase";
        gri = "git rebase --interactive";
        gcp = "git cherry-pick";
        grm = "git rm";
        grp = "git remote prune origin";
        gp = "git push";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
        theme = "robbyrussell";
      };
    };
    git = {
      enable = true;
      userEmail = "mortenhogh@gmail.com";
      userName = "hawkish";
    };
    alacritty = {
      enable = true;
      settings = {
        cursor = {
          style = "Beam";
          unfocused_hollow = false;
          thickness = 0.2;
        };

        selection = {
          save_to_clipboard = true;
        };

        terminal.shell = {
          program = "${pkgs.zsh}/bin/zsh";
          args = [ "-l" ];
        };

        font = {
          normal = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Regular";
          };
          italic = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Italic";
          };
          bold_italic = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Italic";
          };
          bold = {
            family = "JetBrainsMono Nerd Font Mono";
            style = "Bold";
          };
          size = 10.0;
        };

        keyboard.bindings = [
          # Fix Copilot shortcut
          {
            key = "Return";
            mods = "Shift";
            chars = "\\u001B[13;2u";
          }

          {
            key = "Return";
            mods = "Control";
            chars = "\\u001B[13;5u";
          }

          # ⌘ + enter puts window in macOS full screen
          {
            key = "Enter";
            mods = "Command";
            action = "ToggleFullscreen";
          }
          # opt + right and left jump between words
          {
            key = "Right";
            mods = "Alt";
            chars = "\\u001BF";
          }
          {
            key = "Left";
            mods = "Alt";
            chars = "\\u001BB";
          }
          # ⌘ + d adds a pane to the right (splits window vertically)
          {
            key = "D";
            mods = "Command";
            chars = "\\u0002%";
          }
          # ⌘ + ⇧ + d adds a pane below (splits window horizontally)
          {
            key = "D";
            mods = "Command|Shift";
            chars = "\\u0002\"";
          }
          # ⌘ + w prompts you to close the pane; "y" to confirm
          {
            key = "W";
            mods = "Command";
            chars = "\\u0002x";
          }
          # ⌘ + arrows are for directional navigation around the panes
          {
            key = "Down";
            mods = "Command";
            chars = "\\u0002\\u001b[B";
          }
          {
            key = "Up";
            mods = "Command";
            chars = "\\u0002\\u001b[A";
          }
          {
            key = "Left";
            mods = "Command";
            chars = "\\u0002\\u001b[D";
          }
          {
            key = "Right";
            mods = "Command";
            chars = "\\u0002\\u001b[C";
          }
          # ⌘ + ⇧ + enter maximizes the pane within the alacritty window
          {
            key = "Enter";
            mods = "Command|Shift";
            chars = "\\u0002z";
          }
        ];
      };
    };
  };
}
