{ lib, config, ... }:
{
  options.homeModules.desktop.hyprlock.enable = lib.mkEnableOption "hyprlock";
  config = lib.mkIf config.homeModules.desktop.hyprlock.enable {

    programs.hyprlock = {
      enable = true;
    };
  };
}
