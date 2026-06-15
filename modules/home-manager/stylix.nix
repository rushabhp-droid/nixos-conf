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
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    

    targets.hyprland.enable = true;
    
    image = ./raw/Wallpapers/wallhaven-9orq98.jpg;

    polarity = "dark";


    cursor = {
      package = pkgs.whitesur-cursors;
      name = "WhiteSur Cursors";
      size = 24;
    };

    fonts = {
      # Define your global monospace font
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      # Optional: Set a specific font size for all terminals, including Alacritty
      sizes = {
        terminal = 14;
      };
    };
  };
}
