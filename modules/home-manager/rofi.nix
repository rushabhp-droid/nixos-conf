{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.sys.hm.rofi.enable = lib.mkEnableOption "rofi";

  config = lib.mkIf config.sys.hm.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      extraConfig = {
        show-icons = true;
        display-drun = "Applications";
        drun-display-format = "{icon} {name}";
      };
    };
  };
}
