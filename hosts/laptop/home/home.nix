{ ... }:
{
  imports = [ ../../../modules/home-manager ];

  home.username = "rushabhp";
  home.homeDirectory = "/home/rushabhp";
  home.stateVersion = "26.05";

  sys.hm.core.enable = true;
  sys.hm.helix.enable = true;
  sys.hm.gtk.enable = true;
  sys.hm.stylix.enable = true;
  sys.hm.swaync.enable = true;
  sys.hm.swayosd.enable = true;
  sys.hm.zsh.enable = true;
  sys.hm.hyprland.enable = true;
  sys.hm.waybar.enable = true;
  sys.hm.alacritty.enable = true;
  sys.hm.rofi.enable = true;
  sys.hm.hypridle.enable = true;
  sys.hm.hyprlock.enable = true;
}
