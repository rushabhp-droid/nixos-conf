{ userName, ... }:
{
  programs.nixvim = {
    plugins = {
      # In-editor markdown rendering (headings, checkboxes, tables, code blocks)
      render-markdown = {
        enable = true;
        settings = {
          heading.enabled = true;
          code.enabled = true;
          bullet.enabled = true;
          checkbox.enabled = true;
        };
      };

      # Zettelkasten workflow
      obsidian = {
        enable = true;
        settings = {
          workspaces = [
            {
              name = "notes";
              path = "/home/${userName}/Documents/Notes";
            }
          ];

          daily_notes = {
            folder = "daily";
            date_format = "%Y-%m-%d";
          };

          templates = {
            folder = "templates";
          };

          # Zettelkasten-style note IDs (timestamp prefix)
          note_id_func = ''
            function(title)
              local suffix = ""
              if title ~= nil then
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
              else
                for _ = 1, 4 do
                  suffix = suffix .. string.char(math.random(65, 90))
                end
              end
              return tostring(os.date("%Y%m%d%H%M")) .. "-" .. suffix
            end
          '';
          
          ui.enable = false; # render-markdown handles this
          legacy_commands = false;
        };
      };
    };
  };
}
