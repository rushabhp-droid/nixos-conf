{ lib, config, ... }: {
  config = lib.mkIf config.homeModules.programs.neovim.enable {

    programs.nixvim = {
      plugins = {
        telescope.enable = true;
        noice.enable = true;

        alpha = {
          enable = true;
          theme = "dashboard";
        };

        treesitter = {
          enable = true;
          settings = {
            highlight.enable = true;
            ensure_installed = [
              "c"
              "cpp"
              "nix"
              "python"
              "bash"
              "markdown"
              "markdown_inline"
              "qmlls"
            ];
          };
        };

        treesitter-context.enable = true;
        bufferline = {
          enable = true;
        };
        which-key.enable = true;
        neo-tree.enable = true;
        comment.enable = true;
        nvim-autopairs.enable = true;
        indent-blankline.enable = true;
        trouble.enable = true;
        fidget.enable = true;
        neogit.enable = true;

        gitsigns = {
          enable = true;
          settings = {
            current_line_blame = true; # Shows git blame for the current line
          };
        };
      };
    };
  };
}
