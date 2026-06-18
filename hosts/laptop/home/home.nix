{ self, ... }:
{
  imports = [ self.homeManagerModules.default ];

  home = {
    username = "rushabhp";
    homeDirectory = "/home/rushabhp";
    stateVersion = "26.05";
  };

  sys.hm = {
    core.enable = true;
    helix.enable = true;
    gtk.enable = true;
    stylix.enable = true;
    swaync.enable = true;
    swayosd.enable = true;
    zsh.enable = true;
    hyprland.enable = true;
    waybar.enable = true;
    alacritty.enable = true;
    rofi.enable = true;
    hypridle.enable = true;
    hyprlock.enable = true;
    wleave.enable = true;
    vscodium.enable = true;
  };
}
