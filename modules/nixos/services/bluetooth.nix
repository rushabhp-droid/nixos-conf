{ lib, config, ... }:
{
  options.hostModules.services.bluetooth.enable = lib.mkEnableOption "bluetooth";
  config = lib.mkIf config.hostModules.services.bluetooth.enable {

    # AirPods Settings
    programs.librepods = {
      enable = true;
    };

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
  };
}
