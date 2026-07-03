{
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

      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          bashls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
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
}
