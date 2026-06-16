{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.sys.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf config.sys.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true; # Ensures compatibility for apps that don't natively support Wayland yet
      withUWSM = true;
    };

    # Enable GVFS for Nautilus features (trash, mounting, etc.)
    services.gvfs.enable = true;
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      waybar # Highly customizable status bar
      rofi # Application launcher / menu
      awww # Animated wallpaper daemon for Wayland
      brightnessctl # Backlight Control
      wl-clipboard # Command-line copy/paste utilities (essential for terminal life)
      alacritty # Fast, GPU-accelerated terminal emulator
      nautilus # The file manager itself
      xdg-user-dirs
      sushi # GNOME's quick previewer (press Space on a file to view it)
      file-roller # Archive manager (so you can extract .zip/.tar.gz inside Nautilus)
      blueman # Bluetooth device manager
      wleave # Logout Screen
      gnome-disk-utility # Disk Manager

      # Screenshot Utility
      grim
      slurp

      hyprpolkitagent # Polkit Agent
      hyprpwcenter

    ];

    services.blueman.enable = true;

    # Enable XDG Desktop Portals for screen sharing and flatpak compatibility
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
