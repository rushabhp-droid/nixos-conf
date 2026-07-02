{ pkgs, inputs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
    blueman.enable = true;
  };

  security.polkit.enable = true;

  # File Browser
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    xfconf.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Hypr Eco System
    hyprpolkitagent
    hypridle
    hyprlock
    hyprpwcenter
    hyprpaper

    # Desktop
    swaynotificationcenter # Notification Daemon
    swayosd # Volume - Brightness control gui
    kitty # Terminal Emulator
    rofi # Application Launcher
    # inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default # Shell
    waybar
    blueman # Bluetooth device manager
    loupe # image viewer
    clapper # Media Player
    gnome-text-editor # GUI text editor
    wleave # Logout Menu

    # Clipboard
    wl-clipboard
    cliphist

    # Screenshot
    grim
    slurp
    swappy
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
