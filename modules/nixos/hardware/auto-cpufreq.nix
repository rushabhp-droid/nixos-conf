{ lib, config, ... }:
{
  options.hostModules.hardware.auto_cpufreq.enable = lib.mkEnableOption "auto_cpufreq";
  config = lib.mkIf config.hostModules.hardware.auto_cpufreq.enable {

    powerManagement.enable = true;

    services = {
      power-profiles-daemon.enable = false;
      thermald.enable = true;
      auto-cpufreq = {
        enable = true;
        settings = {
          battery = {
            governor = "powersave";
            turbo = "never";
          };
          charger = {
            governor = "performance";
            turbo = "auto";
          };
        };
      };
    };
  };
}
