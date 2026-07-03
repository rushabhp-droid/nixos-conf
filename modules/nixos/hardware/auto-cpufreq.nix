_: {

  powerManagement.enable = true;

  services.power-profiles-daemon.enable = false;

  services.thermald.enable = true;

  services.auto-cpufreq = {
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
}
