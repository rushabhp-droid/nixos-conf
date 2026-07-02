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
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/cardwire.nix
    ../../modules/nixos/auto-cpufreq.nix
    ../../modules/nixos/udev.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    git
    btop
    wget
  ];

  system.stateVersion = stateVersion;
}
