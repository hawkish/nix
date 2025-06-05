{
  autoCmd = [
    {
      desc = "Check if we need to reload the file when it changed";
      event = [
        "FocusGained"
        "TermClose"
        "TermLeave"
        "BufEnter"
        "CursorHold"
        "CursorHoldI"
      ];
      callback.__raw = # lua
        ''
          function()
              if vim.o.buftype ~= "nofile" and vim.fn.mode() ~= 'c' then
                vim.cmd("checktime")
              end
            end
        '';
    }
    {
      desc = "Highlight on yank";
      event = "TextYankPost";
      callback.__raw = # lua
        ''
          function() 
            vim.highlight.on_yank({ higroup="IncSearch", timeout=250 })
          end
        '';
    }
    {
      event = "FileType";
      pattern = "helm";
      command = "LspRestart";
    }
    {
      desc = "Set filetype for Podspec and Podfile to Ruby";
      event = [
        "BufNewFile"
        "BufRead"
      ];
      pattern = [
        "*.podspec"
        "Podfile"
      ];
      command = "set filetype=ruby";
    }
  ];
}
