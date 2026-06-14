{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # 1. Import the Stylix Home Manager module
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;

    # Stop Stylix from starting its own wallpaper daemon
    targets.swaybg.enable = false;
    targets.hyprpaper.enable = false;
    image = ./raw/Wallpapers/wallhaven-ml283m.png;

    polarity = "dark";
  };
}
