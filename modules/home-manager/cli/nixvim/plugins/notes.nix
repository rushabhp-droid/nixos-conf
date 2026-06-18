{ lib, config, ... }:
{
  config = lib.mkIf config.sys.hm.nixvim.enable {
    programs.nixvim.plugins.obsidian = {
      enable = true;
      settings = {
        dir = "~/Documents/Obsidian";
        mappings = {
          "gf" = {
            action = "require('obsidian').util.gf_passthrough";
            opts = {
              noremap = false;
              expr = true;
              buffer = true;
            };
          };
          "<leader>ch" = {
            action = "require('obsidian').util.toggle_checkbox";
            opts = {
              buffer = true;
            };
          };
        };
        # Define how to create new notes
        note_id_func = ''
          function(title)
            local suffix = ""
            if title ~= nil then
              suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
              for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(97, 122))
              end
            end
            return tostring(os.time()) .. "-" .. suffix
          end
        '';
      };
    };

    # Keymaps for obsidian
    programs.nixvim.keymaps = [
      {
        mode = "n";
        key = "<leader>on";
        action = "<cmd>ObsidianNew<cr>";
        options.desc = "New obsidian note";
      }
      {
        mode = "n";
        key = "<leader>os";
        action = "<cmd>ObsidianSearch<cr>";
        options.desc = "Search obsidian notes";
      }
      {
        mode = "n";
        key = "<leader>oq";
        action = "<cmd>ObsidianQuickSwitch<cr>";
        options.desc = "Quick switch obsidian notes";
      }
    ];
  };
}
