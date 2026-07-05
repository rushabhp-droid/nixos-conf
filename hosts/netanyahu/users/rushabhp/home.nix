{ userName, stateVersion, ... }:

{
  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    inherit stateVersion;
  };

  imports = builtins.attrValues (import ../../../../modules/home-manager);

  programs.home-manager.enable = true;

  homeModules = {
    desktop = {
      hyprland.enable = true;
      hypridle.enable = true;
      hyprpaper.enable = true;
      hyprlock.enable = true;
      waybar.enable = true;
    };
    programs = {
      btop.enable = true;
      eza.enable = true;
      swaync.enable = true;
      swayosd.enable = true;
      kitty.enable = true;
      multimedia.enable = true;
      neovim.enable = true;
      wleave.enable = true;
      rofi.enable = true;
      zathura.enable = true;
      zoxide.enable = true;
      zen.enable = true;
    };
    system = {
      gtk.enable = true;
      xdg.enable = true;
      starship.enable = true;
      easy_effects.enable = true;
    };
    dev = {
      helix.enable = true;
      zellij.enable = true;
      dev.enable = true;
    };
  };
}
