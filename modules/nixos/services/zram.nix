{ lib, config, ... }:
{
  options.hostModules.services.zram.enable = lib.mkEnableOption "zram";
  config = lib.mkIf config.hostModules.services.zram.enable {

    zramSwap = {
      enable = true;
      memoryPercent = 50;
    };

    systemd.oomd.enable = true;
  };
}
