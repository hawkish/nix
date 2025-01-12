{
  plugins.copilot-chat = {
    enable = true;
  };

  extraConfigLua = # Lua
    ''
            require("CopilotChat").setup({
              keys = {
      			{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat" },

      			{ "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Copilot Fix" },
      			{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Copilot Explain" },
      			{ "<leader>cr", "<cmd>CopilotChatReview<cr>", desc = "Copilot Review" },
      			{ "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot Optimize" },
      			{ "<leader>cd", "<cmd>CopilotChatDocs<cr>", desc = "Copilot Docs" },
      			{ "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Copilot Tests" },
      			{ "<leader>cx", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Copilot Fix diagnostic" },

      			{ "<leader>cf", "<cmd>'<,'>CopilotChatFix<cr>", desc = "Copilot Fix", mode = "v" },
      			{ "<leader>ce", "<cmd>'<,'>CopilotChatExplain<cr>", desc = "Copilot Explain", mode = "v" },
      			{ "<leader>cr", "<cmd>'<,'>CopilotChatReview<cr>", desc = "Copilot Review", mode = "v" },
      			{ "<leader>co", "<cmd>'<,'>CopilotChatOptimize<cr>", desc = "Copilot Optimize", mode = "v" },
      			{ "<leader>cd", "<cmd>'<,'>CopilotChatDocs<cr>", desc = "Copilot Docs", mode = "v" },
      			{ "<leader>ct", "<cmd>'<,'>CopilotChatTests<cr>", desc = "Copilot Tests", mode = "v" },
      			{ "<leader>cx", "<cmd>'<,'>CopilotChatFixDiagnostic<cr>", desc = "Copilot Fix diagnostic", mode = "v" },
      		}
            })
    '';
}
