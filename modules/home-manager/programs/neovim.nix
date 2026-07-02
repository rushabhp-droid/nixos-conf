{ inputs, pkgs, ... }:
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
          # clangd.enable = true;
          # pyright.enable = true;
          bashls.enable = true;
        };
      };

      markdown-preview = {
        enable = true;
        settings.theme = "dark";
      };
    };

    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
        options.desc = "Toggle Explorer"; # Which-key will read this description
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
    ];
  };
}
