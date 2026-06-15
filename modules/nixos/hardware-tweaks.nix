{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.sys.hardware-tweaks.enable = lib.mkEnableOption "hardware-tweaks";

  config = lib.mkIf config.sys.hardware-tweaks.enable {
    # Firmware updates
    services.fwupd.enable = true;

    # Proactive thermal management for Intel CPUs
    services.thermald.enable = true;

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

    # TLP Power Management
    powerManagement.enable = true;
    services.tlp = {
      enable = true;
      settings = {
        RUNTIME_PM_DENYLIST = "01:00.0 01:00.1";

        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;
      };
    };
  };
}
