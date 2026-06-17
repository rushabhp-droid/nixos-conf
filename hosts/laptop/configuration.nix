{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
    ../../modules/nixos
  ];

  networking.hostName = "twin";

  sys = {
    core.enable = true;
    desktop.enable = true;
    users.enable = true;
    hardware-tweaks.enable = true;
    nvidia.enable = true;
    hyprland.enable = true;
    fonts.enable = true;
    steam.enable = true;
    gaming.enable = true;
    auto-refresh.enable = true;
    sops.enable = true;
    security.enable = false;
  };
}
