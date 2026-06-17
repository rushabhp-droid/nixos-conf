{ ... }:
{
  imports = [
    # System & Core
    ./system/core.nix
    ./system/gtk.nix
    ./system/stylix.nix

    # CLI & Terminal
    ./cli/alacritty.nix
    ./cli/helix.nix
    ./cli/zsh.nix

    # Desktop Environment
    ./desktop/hyprland.nix
    ./desktop/hyprlock.nix
    ./desktop/hypridle.nix
    ./desktop/rofi.nix
    ./desktop/swaync.nix
    ./desktop/swayosd.nix
    ./desktop/waybar.nix
    ./desktop/wleave.nix
    ./desktop/vscodium.nix
  ];
}
