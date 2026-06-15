{ ... }:
{
  imports = [
    ./core.nix
    ./desktop.nix
    ./users.nix
    ./hardware-tweaks.nix
    ./nvidia.nix
    ./hyprland.nix
    ./fonts.nix
    ./steam.nix
    ./auto-refresh.nix
  ];
}
