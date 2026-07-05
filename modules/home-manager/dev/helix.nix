{ lib, config, ... }: {
  options.homeModules.dev.helix.enable = lib.mkEnableOption "helix";
  config = lib.mkIf config.homeModules.dev.helix.enable {

    programs.helix = {
      enable = true;
      settings = {
        editor = {
          bufferline = "multiple";
          cursorline = true;
          line-number = "relative";
          auto-format = true;
          color-modes = true;
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          indent-guides = {
            render = true;
            character = "╎";
            skip-levels = 1;
          };
          lsp = {
            display-messages = true;
            auto-signature-help = false;
          };
          inline-diagnostics = {
            cursor-line = "warning";
            other-lines = "error";
          };
        };
      };

      languages = {
        language = [
          {
            name = "nix";
            auto-format = true;
            formatter = {
              command = "nixfmt";
            };
          }
        ];
      };
    };
  };
}
