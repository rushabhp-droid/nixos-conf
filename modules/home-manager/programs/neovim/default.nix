{ inputs, pkgs, ... }:
{
  # Import all our sub-modules
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins.nix
    ./lsp.nix
    # ./notes.nix
    ./keymaps.nix
  ];

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

    autoCmd = [
      {
            callback = {
          __raw = "function() vim.lsp.buf.format({ async = false }) end";
        };
        desc = "Format Rust files on save using LSP";
      }
    ];

    clipboard.providers.wl-copy.enable = true;
  };
}
