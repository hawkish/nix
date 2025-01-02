{
  plugins.toggleterm.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>t";
      action = "<cmd>ToggleTerm direction=horizontal dir=%:p:h<cr>";
      options = {
        desc = "ToggleTerm with dir set to working directory";
      };
    }
  ];
}
