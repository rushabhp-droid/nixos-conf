{
  lib,
  config,
  ...
}:
{
  options.sys.hardware-tweaks.enable = lib.mkEnableOption "hardware-tweaks";

  config = lib.mkIf config.sys.hardware-tweaks.enable {

    # MSI-EC Controller

    # boot.extraModulePackages = [ config.boot.kernelPackages.msi-ec ];
    # boot.kernelModules = [ "msi-ec" ];

    services = {
      # Firmware updates
      fwupd.enable = true;

      # Proactive thermal management for Intel CPUs
      thermald.enable = true;

      # TLP Power Management
      tlp = {
        enable = true;
        settings = {
          # RUNTIME_PM_DENYLIST = "01:00.0 01:00.1"; # Removed: This prevents the NVIDIA GPU (PCI:1:0:0) from sleeping (D3cold)!

          # Force the NVIDIA GPU and its Audio device to 'auto' so finegrained works on AC too
          RUNTIME_PM_ENABLE = "01:00.0 01:00.1";

          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

          CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
          CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";

          CPU_MIN_PERF_ON_AC = 0;
          CPU_MAX_PERF_ON_AC = 100;
          CPU_MIN_PERF_ON_BAT = 0;
          CPU_MAX_PERF_ON_BAT = 20;
        };
      };
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

    # TLP Power Management
    powerManagement.enable = true;
  };
}
