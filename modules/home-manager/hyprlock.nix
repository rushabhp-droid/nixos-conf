{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.sys.hm.hyprlock.enable = lib.mkEnableOption "hyprlock";

  config = lib.mkIf config.sys.hm.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      # Stylix automatically handles the configuration if targets.hyprlock.enable is true
    };
  };
}
