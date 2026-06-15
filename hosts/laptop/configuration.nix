{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
    ../../modules/nixos
  ];

  networking.hostName = "twin";

  sys.core.enable = true;
  sys.desktop.enable = true;
  sys.users.enable = true;
  sys.hardware-tweaks.enable = true;
  sys.nvidia.enable = true;
  sys.hyprland.enable = true;
  sys.fonts.enable = true;
  sys.steam.enable = true;
  sys.auto-refresh.enable = true;
}
