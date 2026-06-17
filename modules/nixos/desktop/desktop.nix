{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{
  options.sys.desktop.enable = lib.mkEnableOption "desktop";

  config = lib.mkIf config.sys.desktop.enable {
    # Services
    services = {
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;

        extraPackages = with pkgs; [
          where-is-my-sddm-theme
        ];

        theme = "where_is_my_sddm_theme";

      };

      pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
        jack.enable = true;
      };

      libinput.enable = true;

      gnome.gnome-keyring.enable = true;
    };

    security.pam.services.sddm.enableGnomeKeyring = true;

    # Desktop Environment Packages
    environment.systemPackages = [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
