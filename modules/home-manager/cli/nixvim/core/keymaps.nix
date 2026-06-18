{ lib, config, ... }:
{
  config = lib.mkIf config.sys.hm.nixvim.enable {
    programs.nixvim = {
      globals.mapleader = " ";

      keymaps = [
        # Normal mode mappings
        {
          mode = "n";
          key = "<leader>w";
          action = "<cmd>w<cr>";
          options.desc = "Save file";
        }
        {
          mode = "n";
          key = "<leader>q";
          action = "<cmd>q<cr>";
          options.desc = "Quit";
        }

        # Window navigation
        {
          mode = "n";
          key = "<C-h>";
          action = "<C-w>h";
          options.desc = "Go to left window";
        }
        {
          mode = "n";
          key = "<C-j>";
          action = "<C-w>j";
          options.desc = "Go to lower window";
        }
        {
          mode = "n";
          key = "<C-k>";
          action = "<C-w>k";
          options.desc = "Go to upper window";
        }
        {
          mode = "n";
          key = "<C-l>";
          action = "<C-w>l";
          options.desc = "Go to right window";
        }

        # Buffer navigation
        {
          mode = "n";
          key = "<S-h>";
          action = "<cmd>bprevious<cr>";
          options.desc = "Previous buffer";
        }
        {
          mode = "n";
          key = "<S-l>";
          action = "<cmd>bnext<cr>";
          options.desc = "Next buffer";
        }
        {
          mode = "n";
          key = "<leader>bd";
          action = "<cmd>bdelete<cr>";
          options.desc = "Delete buffer";
        }

        # Clear search highlights
        {
          mode = "n";
          key = "<esc>";
          action = "<cmd>nohlsearch<cr>";
          options.desc = "Clear search highlights";
        }
      ];
    };
  };
}
