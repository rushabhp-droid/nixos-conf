{ lib, config, ... }:
{
  config = lib.mkIf config.sys.hm.nixvim.enable {
    programs.nixvim.plugins = {
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "auto";
            globalstatus = true;
          };
        };
      };

      bufferline = {
        enable = true;
      };

      neo-tree = {
        enable = true;
        settings = {
          close_if_last_window = true;
          window = {
            position = "left";
            width = 30;
          };
        };
      };

      web-devicons = {
        enable = true;
      };

      which-key = {
        enable = true;
      };
    };

    programs.nixvim.keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        options.desc = "Toggle Neo-tree";
      }
    ];
  };
}
