{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.hostModules.desktop.sddm.enable = lib.mkEnableOption "sddm";
  config = lib.mkIf config.hostModules.desktop.sddm.enable {

    environment.systemPackages = with pkgs; [
      where-is-my-sddm-theme
    ];

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;

      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qt5compat
        kdePackages.qtvirtualkeyboard
      ];

      theme = "${pkgs.where-is-my-sddm-theme}/share/sddm/themes/where_is_my_sddm_theme";
    };
  };
}
