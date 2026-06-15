{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.sys.hm.gtk.enable = lib.mkEnableOption "gtk";

  config = lib.mkIf config.sys.hm.gtk.enable {
    gtk = {
      enable = true;
      iconTheme = {
        package = pkgs.whitesur-icon-theme;
        name = "WhiteSur-dark";
      };
    };
  };
}
