{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.homeModules.system.gtk.enable = lib.mkEnableOption "gtk";
  config = lib.mkIf config.homeModules.system.gtk.enable {

    gtk = {
      enable = true;

      iconTheme = {
        package = pkgs.whitesur-icon-theme;
        name = "WhiteSur-dark";
      };
    };
  };
}
