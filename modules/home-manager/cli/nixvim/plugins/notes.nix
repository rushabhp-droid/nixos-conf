{ lib, config, ... }:
{
  config = lib.mkIf config.sys.hm.nixvim.enable {
    programs.nixvim.plugins.obsidian = {
      enable = true;
      settings = {
        workspaces = [
          {
            name = "personal";
            path = "~/Documents/Obsidian";
          }
        ];
        legacy_commands = false;

        # Define how to create new notes
        note_id_func = {
          __raw = ''
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
    };

    # Keymaps for obsidian
    programs.nixvim.keymaps = [
      {
        mode = "n";
        key = "<leader>on";
        action = "<cmd>Obsidian new<cr>";
        options.desc = "New obsidian note";
      }
      {
        mode = "n";
        key = "<leader>os";
        action = "<cmd>Obsidian search<cr>";
        options.desc = "Search obsidian notes";
      }
      {
        mode = "n";
        key = "<leader>oq";
        action = "<cmd>Obsidian quick_switch<cr>";
        options.desc = "Quick switch obsidian notes";
      }
    ];
  };
}
