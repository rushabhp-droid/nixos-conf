{ lib, config, ... }:
{
  config = lib.mkIf config.homeModules.programs.neovim.enable {

    programs.nixvim = {
      keymaps = [
        {
          action = "<cmd>lua vim.lsp.buf.format()<CR>";
          key = "<leader>cf"; # Stands for "Code Format"
          options.desc = "Format Document";
        }
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
        # ── IDE Features ─────────────────────────────────────────────
        {
          action = "<cmd>Trouble diagnostics toggle<CR>";
          key = "<leader>xx";
          options.desc = "Toggle Diagnostics (Trouble)";
        }
        {
          action = "<cmd>Neogit<CR>";
          key = "<leader>gg";
          options.desc = "Git Status (Neogit)";
        }

        # ── Debugging (DAP) ──────────────────────────────────────────
        {
          action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
          key = "<leader>db";
          options.desc = "Toggle Breakpoint";
        }
        {
          action = "<cmd>lua require('dap').continue()<CR>";
          key = "<leader>dc";
          options.desc = "Start/Continue Debugging";
        }
        {
          action = "<cmd>lua require('dapui').toggle()<CR>";
          key = "<leader>du";
          options.desc = "Toggle Debug UI";
        }
      ];
    };
  };
}
