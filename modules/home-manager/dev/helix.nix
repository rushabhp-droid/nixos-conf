{
  pkgs,
  lib,
  config,
  userName,
  hostname,
  ...
}:
{
  options.homeModules.dev.helix.enable = lib.mkEnableOption "helix";
  config = lib.mkIf config.homeModules.dev.helix.enable {

    programs.helix = {
      enable = true;
      package = pkgs.evil-helix;
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
        language-server = {
          nixd = {
            command = "${pkgs.nixd}/bin/nixd";
            args = [ "--semantic-tokens=true" ];
            config.nixd =
              let
                flakeDir = "(builtins.getFlake (toString /home/${userName}/nixos-conf))";
                nixosOpts = "${flakeDir}.nixosConfigurations.${hostname}.options";
              in
              {
                nixpkgs.expr = "import ${flakeDir}.inputs.nixpkgs {}";
                formatting.command = [ "nixfmt" ];
                options = {
                  nixos.expr = nixosOpts;
                  home-manager.expr = "${nixosOpts}.home-manager.users.type.getSubOptions []";
                };
              };
          };
        };
      };
    };
  };
}
