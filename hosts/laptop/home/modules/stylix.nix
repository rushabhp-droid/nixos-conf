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

    targets.hyprland.enable = true;
    
    image = ./raw/Wallpapers/wallhaven-qrlwdq.png;

    polarity = "dark";

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
