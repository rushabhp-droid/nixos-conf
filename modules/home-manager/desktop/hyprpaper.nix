{ lib, config, ... }: {
  options.homeModules.desktop.hyprpaper.enable = lib.mkEnableOption "hyprpaper";
  config = lib.mkIf config.homeModules.desktop.hyprpaper.enable {

    # Wallpaper
    services.hyprpaper.enable = true;
  };
}
