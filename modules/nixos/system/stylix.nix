{
  config,
  lib,
  pkgs,
  wallpaper,
  ...
}:
{
  options.hostModules.system.stylix.enable = lib.mkEnableOption "stylix";
  config = lib.mkIf config.hostModules.system.stylix.enable {

    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
      image = wallpaper;

      polarity = "dark";

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };

      opacity = {
        terminal = 0.85;
        popups = 0.85;
      };

      fonts = {

        sizes = {
          desktop = 15;
        };

        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };
      };
    };
  };
}
