{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.sys.hm.swaync.enable = lib.mkEnableOption "swaync";

  config = lib.mkIf config.sys.hm.swaync.enable {
    # Stylix automatically themes SwayNC based on your global settings
    stylix.targets.swaync.enable = true;

    services.swaync = {
      enable = true;
    };
  };
}
