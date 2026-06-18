{ lib, config, ... }:
{
  config = lib.mkIf config.sys.hm.nixvim.enable {
    programs.nixvim.opts = {
      # Line numbers
      number = true;
      relativenumber = true;

      # Indentation
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;

      # UI
      cursorline = true;
      termguicolors = true;
      signcolumn = "yes";

      # Search
      ignorecase = true;
      smartcase = true;

      # Splits
      splitbelow = true;
      splitright = true;

      # Swap/Undo
      swapfile = false;
      undofile = true;

      # Clipboard
      clipboard = "unnamedplus";

      # Misc
      updatetime = 250;
      timeoutlen = 300;
    };
  };
}
