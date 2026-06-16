{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  options.sys.hm.stylix.enable = lib.mkEnableOption "stylix";

  imports = [
    inputs.stylix.homeModules.stylix
  ];

  config = lib.mkIf config.sys.hm.stylix.enable {
    # 1. Import the Stylix Home Manager module

    stylix = {
      enable = true;

      base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";

      targets = {
        # Enabled targets
        alacritty.enable = true;
        hyprland.enable = true;
        waybar.enable = true;
        helix.enable = true;
        gtk.enable = true;
        swaync.enable = true;
        hyprlock.enable = true;

        # Disabled targets (styled manually elsewhere)
        rofi.enable = false;
      };

      image = ./raw/Wallpapers/wallhaven-ml28wk.png;

      polarity = "dark";

      opacity = {
        terminal = 0.85;
        popups = 0.85;
      };

      cursor = {
        package = pkgs.whitesur-cursors;
        name = "WhiteSur-cursors";
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
  };
}
