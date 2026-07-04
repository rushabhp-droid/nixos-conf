{
  pkgs,
  stateVersion,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./disk-config.nix

    # NixOS System Modules
    ../../modules/nixos

    # Hardware-specific modules (per-host)
    ../../modules/nixos/hardware/nvidia.nix
    ../../modules/nixos/hardware/cardwire.nix
    ../../modules/nixos/hardware/auto-cpufreq.nix
    ../../modules/nixos/hardware/udev.nix

    # Roles
    ../../modules/nixos/roles/gaming.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    tuxedo
  ];

  system.stateVersion = stateVersion;
}
