{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.sys.gaming.enable = lib.mkEnableOption "gaming";

  config = lib.mkIf config.sys.gaming.enable {
    environment.systemPackages = with pkgs; [
      mangohud # Hardware/FPS overlay performance tracker
      protonup-qt # GUI engine to install and manage custom GE-Proton layers
      lutris # Game manager
      heroic # Epic/GOG games launcher
      (bottles.override {
        removeWarningPopup = true;
      }) # Run Windows software/games
      prismlauncher # Minecraft Launcher
    ];

    programs.gamemode.enable = true; # Optimizes CPU/GPU mapping on launch
  };
}
