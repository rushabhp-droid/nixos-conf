{ inputs, pkgs, userName, ... }:
{
  # Corrected import path for Home Manager
  imports = [ inputs.nixvim.homeModules.nixvim ];

  stylix.targets.nixvim.enable = true;

  home.packages = with pkgs; [
    ripgrep
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      clipboard = "unnamedplus";
      signcolumn = "yes";
      showmode = false;
      cursorline = true;
      conceallevel = 2; # Required for render-markdown and obsidian link concealment
    };

    plugins = {
      telescope.enable = true;

      noice.enable = true;

      none-ls = {
        enable = true;

        sources = {
          formatting = {
            nixfmt.enable = true;
          };
        };
      };

      alpha = {
        enable = true;
        theme = "dashboard";
      };

      nix = {
        enable = true;
      };

      treesitter = {
        enable = true;
        settings.ensure_installed = [
          "c"
          "cpp"
          "nix"
          "python"
          "bash"
          "markdown"
          "markdown_inline"
        ];
      };

      lualine.enable = true;
      which-key.enable = true;
      neo-tree.enable = true;

      blink-cmp = {
        enable = true;
        setupLspCapabilities = true;
      };

      # Restored the Nixvim-native LSP block
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          bashls.enable = true;
        };
      };

      # ── Note-Taking ──────────────────────────────────────────────────

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

    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
        options.desc = "Toggle Explorer";
      }

      # Telescope bindings
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fw";
        options.desc = "Live Grep";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
        options.desc = "Find Files";
      }
      {
        action = "<cmd>Telescope git_commits<CR>";
        key = "<leader>fg";
        options.desc = "Git Commits";
      }
      {
        action = "<cmd>Telescope oldfiles<CR>";
        key = "<leader>fh";
        options.desc = "Recent Files";
      }
      {
        action = "<cmd>Telescope colorscheme<CR>";
        key = "<leader>ch";
        options.desc = "Colorschemes";
      }
      {
        action = "<cmd>Telescope man_pages<CR>";
        key = "<leader>fm";
        options.desc = "Man Pages";
      }

      # ── Notes (Zettelkasten) ─────────────────────────────────────
      {
        action = "<cmd>Obsidian new<CR>";
        key = "<leader>nn";
        options.desc = "New Note";
      }
      {
        action = "<cmd>Obsidian dailies<CR>";
        key = "<leader>nd";
        options.desc = "Daily Notes";
      }
      {
        action = "<cmd>Obsidian search<CR>";
        key = "<leader>ns";
        options.desc = "Search Notes";
      }
      {
        action = "<cmd>Obsidian links<CR>";
        key = "<leader>nl";
        options.desc = "Note Links";
      }
      {
        action = "<cmd>Obsidian backlinks<CR>";
        key = "<leader>nb";
        options.desc = "Backlinks";
      }
      {
        action = "<cmd>Obsidian tags<CR>";
        key = "<leader>nt";
        options.desc = "Search Tags";
      }
      {
        action = "<cmd>RenderMarkdown toggle<CR>";
        key = "<leader>nr";
        options.desc = "Toggle Preview";
      }
    ];
  };
}
