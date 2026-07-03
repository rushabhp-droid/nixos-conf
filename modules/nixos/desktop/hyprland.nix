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
    swayosd.enable = true;
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
    hyprpwcenter

    # Desktop
    gnome-text-editor # GUI text editor
    brightnessctl
    playerctl

    # Clipboard
    wl-clipboard

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
