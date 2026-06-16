{ ... }:
{
  imports = [
    # System & Core
    ./system/core.nix
    ./system/users.nix
    ./system/sops.nix
    ./system/auto-refresh.nix
    ./system/security.nix

    # Desktop & GUI
    ./desktop/desktop.nix
    ./desktop/hyprland.nix
    ./desktop/fonts.nix

    # Hardware
    ./hardware/hardware-tweaks.nix
    ./hardware/nvidia.nix

    # Applications
    ./apps/steam.nix
    ./apps/gaming.nix
  ];
}
