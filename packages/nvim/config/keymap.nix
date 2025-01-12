{
  globals.mapleader = " ";

  keymaps = [

    # Copilot
    {
      mode = "n";
      key = "<leader>cc";
      action = "<cmd>CopilotChatToggle<cr>";
      options = {
        desc = "Copilot Chat";
      };
    }
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>CopilotChatFix<cr>";
      options = {
        desc = "Copilot Fix";
      };
    }
    {
      mode = "n";
      key = "<leader>cr";
      action = "<cmd>CopilotChatExplain<cr>";
      options = {
        desc = "Copilot Explain";
      };
    }
    {
      mode = "n";
      key = "<leader>cr";
      action = "<cmd>CopilotChatReview<cr>";
      options = {
        desc = "Copilot Review";
      };
    }
    {
      mode = "n";
      key = "<leader>co";
      action = "<cmd>CopilotChatOptimize<cr>";
      options = {
        desc = "Copilot Optimize";
      };
    }
    {
      mode = "n";
      key = "<leader>cd";
      action = "<cmd>CopilotChatDocs<cr>";
      options = {
        desc = "Copilot Docs";
      };
    }
    {
      mode = "n";
      key = "<leader>ct";
      action = "<cmd>CopilotChatTests<cr>";
      options = {
        desc = "Copilot Tests";
      };
    }
    {
      mode = "n";
      key = "<leader>cx";
      action = "<cmd>CopilotChatFixDiagnostic<cr>";
      options = {
        desc = "Copilot Fix diagnostic";
      };
    }
    {
      mode = "v";
      key = "<leader>cf";
      action = "<cmd>'<,'>CopilotChatFix<cr>";
      options = {
        desc = "Copilot Fix";
      };
    }
    {
      mode = "v";
      key = "<leader>ce";
      action = "<cmd>'<,'>CopilotChatExplain<cr>";
      options = {
        desc = "Copilot Explain";
      };
    }
    {
      mode = "v";
      key = "<leader>cr";
      action = "<cmd>'<,'>CopilotChatReview<cr>";
      options = {
        desc = "Copilot Review";
      };
    }
    {
      mode = "v";
      key = "<leader>co";
      action = "<cmd>'<,'>CopilotChatOptimize<cr>";
      options = {
        desc = "Copilot Optimize";
      };
    }
    {
      mode = "v";
      key = "<leader>cd";
      action = "<cmd>'<,'>CopilotChatDocs<cr>";
      options = {
        desc = "Copilot Docs";
      };
    }
    {
      mode = "v";
      key = "<leader>ct";
      action = "<cmd>'<,'>CopilotChatTests<cr>";
      options = {
        desc = "Copilot Tests";
      };
    }
    {
      mode = "v";
      key = "<leader>cx";
      action = "<cmd>'<,'>CopilotChatFixDiagnostic<cr>";
      options = {
        desc = "Copilot Fix diagnostic";
      };
    }

    # Search/Replace
    {
      mode = "n";
      key = "<leader>r";
      action = ":%s:::c<left><left><left>";
      options = {
        desc = "Replace";
      };
    }

    {
      mode = "v";
      key = "<leader>r";
      action = "sy:%s:<c-r>s::c<left><left>";
      options = {
        desc = "Replace";
      };
    }

    # Move lines
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>m .+1<cr>==";
      options = {
        desc = "Move up";
      };
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>m .-2<cr>==";
      options = {
        desc = "Move down";
      };
    }
    {
      mode = "i";
      key = "<A-j>";
      action = "<esc><cmd>m .+1<cr>==gi";
      options = {
        desc = "Move up";
      };
    }
    {
      mode = "i";
      key = "<A-k>";
      action = "<esc><cmd>m .-2<cr>==gi";
      options = {
        desc = "Move down";
      };
    }
    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<cr>gv=gv";
      options = {
        desc = "Move up";
      };
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '>-2<cr>gv=gv";
      options = {
        desc = "Move down";
      };
    }

    # Clear search
    {
      mode = "n";
      key = "<esc>";
      action = "<cmd>nohl<CR>";
      options = {
        desc = "Clear search";
      };
    }
    # Change window
    {
      mode = "n";
      key = "<C-left>";
      action = "<C-w>h";
      options = {
        desc = "Go to Left Window";
      };
    }
    {
      mode = "n";
      key = "<C-down>";
      action = "<C-w>j";
      options = {
        desc = "Go to Lower Window";
      };
    }
    {
      mode = "n";
      key = "<C-up>";
      action = "<C-w>k";
      options = {
        desc = "Go to Upper Window";
      };
    }
    {
      mode = "n";
      key = "<C-right>";
      action = "<C-w>l";
      options = {
        desc = "Go to Right Window";
      };
    }
    # Categories
    {
      mode = "n";
      key = "<leader>f";
      action = "+find/file";
      options = {
        desc = "+file/file";
      };
    }
    {
      mode = "n";
      key = "<leader>s";
      action = "+search";
      options = {
        desc = "+search";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>g";
      action = "+git";
      options = {
        desc = "+git";
      };
    }

    {
      mode = "n";
      key = "<leader>u";
      action = "+ui";
      options = {
        desc = "+ui";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>c";
      action = "+code";
      options = {
        desc = "+code";
      };
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-W>h";
      options = {
        silent = true;
        desc = "Move to window left";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-W>j";
      options = {
        silent = true;
        desc = "Move to window bellow";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-W>k";
      options = {
        silent = true;
        desc = "Move to window over";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-W>l";
      options = {
        silent = true;
        desc = "Move to window right";
      };
    }
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }
    # Quit
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }
    {
      mode = "n";
      key = "<leader>ul";
      action = ":lua ToggleLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Numbers";
      };
    }
    {
      mode = "n";
      key = "<leader>uw";
      action = ":lua ToggleWrap()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Wrap";
      };
    }
    # {
    #   mode = "n";
    #   key = "J";
    #   action = "mzJ`z";
    #   options = {
    #     desc = "Allow cursor to stay in the same place after appending to current line";
    #   };
    # }
    {
      mode = "n";
      key = "<Tab>";
      action = "<CMD>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<CR>";
      options = {
        desc = "Next buffer";
      };
    }
  ];
  # extraConfigLua = # Lua
  #   ''
  #     function ToggleLineNumber()
  #       if vim.wo.number then
  #         vim.wo.number = false
  #       else
  #         vim.wo.number = true
  #         vim.wo.relativenumber = false
  #       end
  #     end
  #
  #     function ToggleWrap()
  #       vim.wo.wrap = not vim.wo.wrap
  #     end
  #   '';
}
