{
  lib,
  config,
  ...
}:
{
  options.sys.hardware-tweaks.enable = lib.mkEnableOption "hardware-tweaks";

  config = lib.mkIf config.sys.hardware-tweaks.enable {
    services = {
      # Firmware updates
      fwupd.enable = true;

      # Proactive thermal management for Intel CPUs
      thermald.enable = true;

      # Power Profiles Daemon
      power-profiles-daemon.enable = true;
    };

    # Bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true; # Shows battery percentage for supported devices
        };
      };
    };

    # NixOS Power Management
    powerManagement.enable = true;
  };
}
