{ lib, config, ... }: {
  config = lib.mkIf config.homeModules.programs.neovim.enable {

    programs.nixvim = {
      plugins = {
        nix = {
          enable = true;
        };

        none-ls = {
          enable = true;
          sources = {
            formatting = {
              nixfmt.enable = true;
              prettier.enable = true;
            };
          };
        };

        luasnip.enable = true;
        friendly-snippets.enable = true;

        blink-cmp = {
          enable = true;
          setupLspCapabilities = true;
        };

        lsp-format.enable = true;
        lsp = {
          enable = true;
          servers = {
            nil_ls.enable = true;
            bashls.enable = true;
            lua_ls.enable = true;
            rust_analyzer = {
              enable = true;

              installCargo = false;
              installRustc = false;

              # Optional: Pass specific settings directly to rust-analyzer
              settings = {
                checkOnSave = {
                  command = "clippy"; # Use clippy instead of cargo check for better linting
                };
              };
            };
          };
        };

        dap = {
          enable = true;
        };
        dap-ui.enable = true;
        dap-virtual-text.enable = true;
      };
    };
  };
}
