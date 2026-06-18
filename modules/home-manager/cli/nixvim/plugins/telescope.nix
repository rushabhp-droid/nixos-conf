{ lib, config, ... }:
{
  config = lib.mkIf config.sys.hm.nixvim.enable {
    programs.nixvim.plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options = {
            desc = "Find files";
          };
        };
        "<leader>fg" = {
          action = "live_grep";
          options = {
            desc = "Live grep";
          };
        };
        "<leader>fb" = {
          action = "buffers";
          options = {
            desc = "Find buffers";
          };
        };
        "<leader>fh" = {
          action = "help_tags";
          options = {
            desc = "Find help";
          };
        };
      };
      settings = {
        defaults = {
          mappings = {
            i = {
              "<C-j>" = {
                __raw = "require('telescope.actions').move_selection_next";
              };
              "<C-k>" = {
                __raw = "require('telescope.actions').move_selection_previous";
              };
            };
          };
        };
      };
    };
  };
}
