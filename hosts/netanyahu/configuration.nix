{ pkgs, stateVersion, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./disk-config.nix

    # Overlays
    ../../overlays
  ]
  ++ builtins.attrValues (import ../../modules/nixos);

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    tuxedo
  ];

  hostModules = {
    hardware = {
      nvidia.enable = true;
      cardwire.enable = true;
      auto_cpufreq.enable = true;
      udev.enable = true;
    };
    roles.gaming.enable = true;

    core = {
      boot.enable = true;
      networking.enable = true;
      locale.enable = true;
      sound.enable = true;
      users.enable = true;
      nix.enable = true;
    };

    desktop = {
      hyprland.enable = true;
      sddm.enable = true;
    };

    services = {
      bluetooth.enable = true;
      virtualization.enable = true;
      ssh.enable = true;
      zram.enable = true;
    };

    system = {
      bash.enable = true;
      stylix.enable = true;
      nix_ld.enable = true;
      security.enable = true;
    };
  };

  system.stateVersion = stateVersion;
}
