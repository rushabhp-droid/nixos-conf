{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  options.homeModules.programs.neovim.enable = lib.mkEnableOption "neovim";
  imports = [ inputs.nixvim.homeModules.nixvim ];
  config = lib.mkIf config.homeModules.programs.neovim.enable {

    # Import all our sub-modules

    stylix.targets.nixvim.enable = true;

    home.packages = with pkgs; [ ripgrep ];

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
  };
}
